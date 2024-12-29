{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/default.nix
  ];

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    extraModprobeConfig = ''
      options snd_hda_intel power_save=0
    '';
  };

  hardware = {
    bluetooth.enable = true;
    bluetooth.powerOnBoot = false;

    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia = {
      modesetting.enable = true;
      powerManagement = {
        enable = false;
        finegrained = false;
      };
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
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

    # Thunar extra's
    gvfs.enable = true; # Mount, trash, and other functionalities
    tumbler.enable = true; # Thumbnail support for images

    # Other
    libinput.enable = true;
    openssh.enable = true;
    printing.enable = true;
    fstrim.enable = true; # Weekly SSD trimming WARNING: Only on ssd systems
    xserver = {
      videoDrivers = ["nvidia"];
      xkb = {
        layout = "us";
        options = "caps:swapescape,compose:ralt";
      };
    };
  };
  console.useXkbConfig = true; # Use xkb keyboard config in tty

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
      acpi # For showing battery status (useful in tty)
      distrobox # Escape route
      gcc # C compiler
      git
      gnumake # Make
      htop
      hyprpolkitagent # Polkit agent needed for apps that request elevated privileges
      inputs.neovim-nightly-overlay.packages.${pkgs.system}.default # nvim nightly build
      killall
      nh # Nix helper that I use to collect garbage except last couple rebuilds
      ntfs3g # Needed to mount windows drive
      ripgrep
      unzip
      wget
    ];
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
      NH_FLAKE = "/home/vic/Git/xxheyhey/nixos-xx";
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
  security.polkit = {
    enable = true;

    # Rules to give some permissions to normal users
    extraConfig = ''
      polkit.addRule(function(action, subject) {
        if (
          subject.isInGroup("users")
            && (
              # reboot and poweroff
              action.id == "org.freedesktop.login1.reboot" ||
              action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
              action.id == "org.freedesktop.login1.power-off" ||
              action.id == "org.freedesktop.login1.power-off-multiple-sessions" ||

              # mount
              action.id == "io.systemd.mount-file-system.mount-image" ||
              action.id == "io.systemd.mount-file-system.mount-image" ||
              action.id == "io.systemd.mount-file-system.mount-untrusted-image" ||
              action.id == "io.systemd.mount-file-system.mount-untrusted-image-privately" ||
              action.id == "org.freedesktop.udisks2.filesystem-mount" ||
              action.id == "org.freedesktop.udisks2.filesystem-mount-other-seat" ||
              action.id == "org.freedesktop.udisks2.filesystem-mount-other-user" ||
              action.id == "org.freedesktop.udisks2.filesystem-mount-system" ||
              action.id == "org.freedesktop.udisks2.filesystem-unmount-others"
            )
          )
        {
          return polkit.Result.YES;
        }
      });
    '';
  };
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

  specialisation = {
    # Nvidia sync specialisation
    nvidia-sync.configuration = {
      system.nixos.tags = ["nvidia-sync"];
      hardware.nvidia = {
        prime = {
          offload = {
            enable = lib.mkForce false;
            enableOffloadCmd = lib.mkForce false;
          };
          sync.enable = lib.mkForce true;
        };
      };
    };
  };

  # DO NOT CHANGE!!!!!!!!!!! See https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11";
}
