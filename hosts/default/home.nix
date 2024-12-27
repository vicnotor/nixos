{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
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
      swww # Wallpaper service
      brightnessctl
      playerctl
      onedrive
      openssl # Needed for onedrive
      networkmanagerapplet
      pavucontrol # Audio controls
      wl-clipboard
      pandoc # markdown to pdf
      texlive.combined.scheme-small # Needed for pandoc
      spotify
      qimgv # Image viewer
      wl-gammarelay-rs # Blue light filter
      wev # xev for wayland
      xorg.xeyes
      evince # pdf
      fastfetch # Neofetch
      fd
      fzf
      zapzap # Whatsapp
      libreoffice
      teams-for-linux
      thunderbird-latest # Mail client
      obs-studio
      mpv # Video player
      alejandra # Nix formatting
      nixd # Nix lsp
      grim # screenshot tool
      slurp # select part of screen for screenshot
      grimblast # Hyprland wrapper for grim and slurp

      # Languages
      nodejs
      python312
      python312Packages.m2crypto # Needed for Python SSL support
      R
      yarn # Needed for vim ( TODO: find out what for exactly)

      # # You can also create simple shell scripts directly inside your
      # # configuration. For example, this adds a command 'my-hello' to your
      # # environment:
      # (pkgs.writeShellScriptBin "my-hello" ''
      #   echo "Hello, ${config.home.username}!"
      # '')
    ];

    # Dotfiles
    file = {
      # Setting file contents immediately:
      ".config/uwsm/env".text = ''
        export XCURSOR_THEME,BreezeX-RosePine-Linux
        export XCURSOR_SIZE,20
        # export AQ_DRM_DEVICES="/dev/dri/card2;/dev/dri/card1"
      '';
      ".config/onedrive/config".text = ''
        sync_dir="~/personal"
        skip_dir=".git"
      '';
      ".config/rofi/config.rasi".text = ''
        @theme "${pkgs.rofi-wayland}/share/rofi/themes/arthur.rasi"
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
