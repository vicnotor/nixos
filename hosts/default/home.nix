{ config, pkgs, inputs, ... }:

{
  imports =
    [ 
      ../../modules/home-manager/default.nix
    ];
  home = {

    # Home Manager stuff
    username = "vic";
    homeDirectory = "/home/vic";
    stateVersion = "24.11"; # NEVER CHANGE THIS!

    # User packages
    packages = with pkgs; [
      alacritty
      rofi-wayland
      google-chrome
      dunst # Notification service ( TODO: Change this to a service daemon that auto starts)
      libnotify # Needed for dunst
      swww # Wallpaper service
      brightnessctl
      playerctl
      onedrive
      openssl # Needed for onedrive
      networkmanagerapplet
      pavucontrol # Audio controls
      R
      nodejs
      wl-clipboard
      pandoc # markdown to pdf
      texlive.combined.scheme-full
      yarn # Needed for vim ( TODO: find out what for exactly)
      spotify
      qimgv # Image viewer
      wl-gammarelay-rs # Blue light filter
      wev # xev for wayland
      xorg.xeyes
      evince # pdf
      fastfetch # Neofetch
      fd
      fzf
      tmux
      zoxide # better cd command (and cdi command)
      zapzap # Whatsapp
      libreoffice
      teams-for-linux

      # # You can also create simple shell scripts directly inside your
      # # configuration. For example, this adds a command 'my-hello' to your
      # # environment:
      # (pkgs.writeShellScriptBin "my-hello" ''
      #   echo "Hello, ${config.home.username}!"
      # '')
    ];

    # Dotfiles
    file = {
      # # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;

      # # You can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
    };

    # Session variables
    sessionVariables = {
      EDITOR = "nvim";
    };

    pointerCursor = {
      gtk.enable = true;
      # x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 16;
    };

  };
  gtk = {
    enable = true;

    theme = {
      package = pkgs.rose-pine-gtk-theme;
      name = "rose-pine";
    };

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };

    font = {
      name = "Ubuntu Nerd Font";
      size = 11;
    };
  };

  programs = {
    home-manager.enable = true;
  };
}
