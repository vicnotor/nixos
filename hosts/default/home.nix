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
      zapzap # Whatsapp
      libreoffice
      teams-for-linux
      thunderbird-latest # Mail client
      obs-studio
      mpv # Video player

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

      # Or set the file content immediately:
      ".config/uwsm/env".text = ''
          export XCURSOR_THEME,BreezeX-RosePine-Linux
          export XCURSOR_SIZE,20
          # export AQ_DRM_DEVICES="/dev/dri/card2;/dev/dri/card1"
          if [ -d "$HOME/personal/bin" ] ; then
            export PATH="$HOME/personal/bin:$PATH"
          fi
      '';
    };

    # Session variables
    sessionVariables = {
      EDITOR = "nvim";
    };

    pointerCursor = {
      gtk.enable = true;
      # x11.enable = true;
      package = pkgs.rose-pine-cursor;
      name = "BreezeX-RosePine-Linux";
      size = 20;
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
