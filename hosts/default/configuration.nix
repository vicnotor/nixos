{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  nix = {
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    settings = {
      experimental-features = ["nix-command" "flakes"];
      substituters = [
        "https://hyprland.cachix.org"
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };
  nixpkgs.config.allowUnfree = true;

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    extraModprobeConfig = ''
      options snd_hda_intel power_save=0
    '';
  };

  hardware = {
    graphics.enable = true;
    nvidia.modesetting.enable = true;
    bluetooth.enable = true;
    bluetooth.powerOnBoot = false;
  };
  powerManagement.enable = true;

  networking = {
    hostName = "nixlap";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [57621]; # For Spotify
      allowedUDPPorts = [5353]; # For Spotify
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  time.timeZone = "Europe/Amsterdam";
  i18n.defaultLocale = "en_US.UTF-8";

  # Services
  services = {
    # Power management
    thermald.enable = true;
    auto-cpufreq.enable = true;
    auto-cpufreq.settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };

    # Sound
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
    blueman.enable = true;

    # Thunar
    gvfs.enable = true; # Mount, trash, and other functionalities
    tumbler.enable = true; # Thumbnail support for images

    # Other
    libinput.enable = true;
    openssh.enable = true;
    printing.enable = true;
  };

  users.defaultUserShell = pkgs.zsh;
  users.users.vic = {
    isNormalUser = true;
    home = "/home/vic";
    extraGroups = ["wheel" "networkmanager"]; # Enable ‘sudo’ for the user.
    initialPassword = "password";
  };

  programs = {
    uwsm = {
      enable = true;
      waylandCompositors = {
        hyprland = {
          prettyName = "Hyprland";
          comment = "Hyprland compositor managed by UWSM";
          binPath = "/run/current-system/sw/bin/Hyprland";
        };
      };
    };
    hyprland = {
      enable = true;
      withUWSM = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
      ];
    };

    # AppImage support
    appimage.enable = true;
    appimage.binfmt = true;

    zsh.enable = true;
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        icu # Needed for marksman
      ];
    };
  };

  # virtualisation
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  # Env
  environment = {
    systemPackages = with pkgs; [
      gcc
      git
      gnumake
      htop
      killall
      inputs.neovim-nightly-overlay.packages.${pkgs.system}.default
      ripgrep
      unzip
      wget
      distrobox
      hyprpolkitagent # Polkit agent needed for apps that request elevated privileges
    ];
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };
    pathsToLink = ["/share/zsh"];
    localBinInPath = true;
  };

  #----=[ Fonts ]=----#
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      helvetica-neue-lt-std
      nerd-fonts.ubuntu
      nerd-fonts.ubuntu-mono
      nerd-fonts.ubuntu-sans
      noto-fonts-emoji
    ];

    fontconfig = {
      defaultFonts = {
        serif = ["Ubuntu Nerd Font"];
        sansSerif = ["UbuntuSans Nerd Font"];
        monospace = ["UbuntuMono Nerd Font"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };

  # Polkit
  security.polkit.enable = true;
  systemd = {
    user.services.hyprpolkitagent = {
      description = "Hyprpolkitagent service";
      wantedBy = ["graphical-session.target"];
      wants = ["graphical-session.target"];
      after = ["graphical-session.target"];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  # DO NOT CHANGE!!!!!!!!!!! See https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11";
}
