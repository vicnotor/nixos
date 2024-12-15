{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
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
      allowedTCPPorts = [ 57621 ]; # For Spotify
      allowedUDPPorts = [ 5353 ]; # For Spotify
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
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

    # Other
    libinput.enable = true;
    openssh.enable = true;
    printing.enable = true;
  };
  
  users.defaultUserShell = pkgs.zsh;
  users.users.vic = {
    isNormalUser = true;
    home = "/home/vic";
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
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
      withUWSM  = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

    thunar = {
      enable = true;
      plugins = [
        pkgs.xfce.thunar-archive-plugin
      ];
    };

    # AppImage support
    appimage.enable = true;
    appimage.binfmt = true;

    zsh = {
      enable = true;
      enableCompletion = true;
      shellAliases = {
        # Vim
        vim = "nvim";
        vi = "vim";
        v = "vim";
        svim = "sudo nvim";
        svi = "svim";
        sv = "svim";

        # Git
        g = "git";
        gs = "git status";
        gP = "git push";
        gpo = "git push origin";
        gpom = "git push origin master";
        gp = "git pull --rebase";
        ga = "git add";
        gaa = "git add --all";
        gc = "git commit --verbose";
        glo = "git log --pretty=oneline";
        
        # ls
        ls = "ls -l --color=tty --group-directories-first --human-readable";
        ll = "ls -alF";
        la = "ls -A";
        l = "ls -CF";

        # Tmux
        t = "tmux";
        ta = "tmux attach";
        tl = "tmux ls";
        tls = "tmux ls";
        tk = "tmux kill-server";
        ts = "tmux-sessionizer";

        # Syncing
        syncy = "onedrive --sync";
        syncoff = "onedrive --sync && poweroff";
        syncreboot = "onedrive --sync && reboot";
        
        # NixOS
        rebuild = "sudo nixos-rebuild switch --flake ~/Git/xxheyhey/nixos-xx#default";
        cvim = "sudo nvim /etc/nixos/configuration.nix";

        # Gammastep
        night = "gammastep -m wayland -P -O";
        nighty = "night 2800";
        nightmax = "night 1000";
        nightlight = "night 4100";
        nightlighter = "night 5500";
        nightoff = "night 6500";

        # Nice ones
        H = "Hyprland";
        ":q" = "exit";
        ":Q" = "exit";
        off = "poweroff";
        browser = "google-chrome";
        ff = "fastfetch";
        nf = "fastfetch";
        goto = "source";
        chx = "chmod +x";
        open = "xdg-open";
        py = "python";
      };
      ohMyZsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "robbyrussell";
      };
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
      neovim
      ripgrep
      unzip
      wget
      distrobox
    ];
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };
    pathsToLink = [ "/share/zsh" ];
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
        serif = [  "Ubuntu Nerd Font" ];
        sansSerif = [ "UbuntuSans Nerd Font" ];
        monospace = [ "UbuntuMono Nerd Font" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };

  # DO NOT CHANGE!!!!!!!!!!! See https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11";
}
