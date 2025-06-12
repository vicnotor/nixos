# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  imports = [./hardware-configuration.nix];

  environment.systemPackages = with pkgs; [
    neovim
    git
    tmux
    btop
    killall
    pciutils
    ffmpeg
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  users = {
    defaultUserShell = pkgs.zsh;
  };

  programs.zsh.enable = true;
  environment.pathsToLink = ["/share/zsh"];

  services.xserver.xkb = {
    layout = "us";
    options = "caps:swapescape,compose:ralt";
  };
  console.useXkbConfig = true;

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  # Tailscale setup
  services.tailscale.enable = true;
  networking.firewall.allowedTCPPorts = [22];
  services.openssh.enable = true;
  services.openssh.settings = {
    PasswordAuthentication = false;
    PermitRootLogin = "no";
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixtop2";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Amsterdam";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nl_NL.UTF-8";
    LC_IDENTIFICATION = "nl_NL.UTF-8";
    LC_MEASUREMENT = "nl_NL.UTF-8";
    LC_MONETARY = "nl_NL.UTF-8";
    LC_NAME = "nl_NL.UTF-8";
    LC_NUMERIC = "nl_NL.UTF-8";
    LC_PAPER = "nl_NL.UTF-8";
    LC_TELEPHONE = "nl_NL.UTF-8";
    LC_TIME = "nl_NL.UTF-8";
  };

  users.users.vic = {
    isNormalUser = true;
    description = "vic";
    extraGroups = ["networkmanager" "wheel"];
    initialPassword = "password";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICR8EEpWCuCjY3cNiHE5eoXddd5d1msQ9t7EI0MgJbq+ vic@nixos"
    ];
  };

  boot.kernelParams = [
    "pcie_aspm=off" # Prevent PCIe link instability
    "iwlwifi.power_save=0" # Avoid iwlwifi power hangs
    "intel_iommu=off" # Optional: reduces DMA-related PCIe issues
  ];
  hardware.enableRedistributableFirmware = true;
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="pci", ATTR{power/control}="on"
  '';
  systemd.services.recover-iwlwifi = {
    description = "Auto-recover Intel Wi-Fi if it crashes";
    wantedBy = ["multi-user.target"];
    after = ["network.target"];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = pkgs.writeShellScript "recover-iwlwifi" ''
        export PATH=${pkgs.pciutils}/bin:${pkgs.coreutils}/bin:${pkgs.util-linux}/bin:${pkgs.gnugrep}/bin

        DEVICE="0000:04:00.0"
        LOG="/var/log/iwlwifi-reset.log"

        # Gather dmesg output related to iwlwifi
        DMESG="$(dmesg | tail -n 100)"

        # Check for any of the known error messages
        if echo "$DMESG" | grep -qE 'HW_REV=0xFFFFFFFF|enquete_hcmd failed|SCAN_OFFLOAD_REQUEST_CMD|iwlwifi.*Error'; then
         	  echo "$(date): Detected iwlwifi error — attempting recovery" >> "$LOG"
         	  echo 1 > /sys/bus/pci/devices/$DEVICE/remove
         	  sleep 2
         	  echo 1 > /sys/bus/pci/rescan
         	  modprobe -r iwlwifi || true
         	  modprobe iwlwifi
         	  echo "$(date): Recovery finished" >> "$LOG"
        else
         	  echo "$(date): iwlwifi appears healthy, skipping reset" >> "$LOG"
        fi
      '';
    };
  };
  systemd.timers.recover-iwlwifi-timer = {
    wantedBy = ["timers.target"];
    timerConfig = {
      OnBootSec = "1min";
      OnUnitActiveSec = "5min";
      Unit = "recover-iwlwifi.service";
    };
  };

  system.stateVersion = "24.11"; # NEVER CHANGE THIS!
}
