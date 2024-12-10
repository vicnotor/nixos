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
      (waybar.overrideAttrs (oldAttrs: {
          mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
        })
      )
      libnotify
      dunst
      swww
      brightnessctl
      playerctl
      onedrive
      networkmanagerapplet
      pavucontrol
      R
      nodejs
      wl-clipboard
      pandoc
      texlive.combined.scheme-full
      yarn
      spotify
      qimgv
      wl-gammarelay-rs
      wev
      xorg.xeyes
      evince
      fastfetch
      fd
      fzf
      tmux
      zoxide
      whatsie
      zapzap

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
  };

  programs = {
    home-manager.enable = true;
  };
}
