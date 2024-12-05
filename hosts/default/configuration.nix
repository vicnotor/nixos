{ config, lib, pkgs, inputs, ... }:

with pkgs;
let
    R-with-packages = rWrapper.override{ packages = with rPackages; [
    ggplot2
    dplyr
    deSolve
    rootSolve
    coda
    FME
    ]; };
in

{
  imports =
    [ 
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  # Nix settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  # Use the systemd-boot EFI boot loader.
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    extraModprobeConfig = ''
      options snd_hda_intel power_save=0
    '';
  };

  networking = {
    hostName = "nixlap";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 57621 ];
      allowedUDPPorts = [ 5353 ];
    };
  };

  time.timeZone = "Europe/Amsterdam";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  powerManagement.enable = true;

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

    # Touchpad
    libinput.enable = true;

    openssh.enable = true;
  };
  
  # User account. Don't forget to set a password with ‘passwd’.
  users.defaultUserShell = pkgs.zsh;
  users.users.vic = {
    isNormalUser = true;
    home = "/home/vic";
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      vic = import ./home.nix ;
    };
  };

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    # AppImage support
    appimage.enable = true;
    appimage.binfmt = true;

    thunar = {
      enable = true;
      plugins = [
        pkgs.xfce.thunar-archive-plugin
      ];
    };
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
        rebuild = "sudo nixos-rebuild switch --flake ~/Git/xxheyhey/nixos-xx";
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
        goto = "source";
        chx = "chmod +x";
      };
      ohMyZsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "robbyrussell";
      };
    };
  };

  environment = {
    systemPackages = with pkgs; [
      git
      vim
      neovim
      wget
      alacritty
      rofi-wayland
      google-chrome
      (waybar.overrideAttrs (oldAttrs: {
          mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
        })
      )
      dunst
      libnotify
      swww
      fastfetch
      brightnessctl
      playerctl
      htop
      tmux
      onedrive
      networkmanagerapplet
      pavucontrol
      killall
      R-with-packages
      gcc
      nodejs
      ripgrep
      unzip
      wl-clipboard
      fzf
      fd
      pandoc
      texlive.combined.scheme-full
      gnumake
      yarn
      zoxide
      spotify
      gammastep
      whatsapp-for-linux
    ];
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };
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


  hardware = {
    graphics.enable = true;
    nvidia.modesetting.enable = true;
    bluetooth.enable = true;
    bluetooth.powerOnBoot = false;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # DO NOT CHANGE!!!!!!!!!!! See https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?
}
