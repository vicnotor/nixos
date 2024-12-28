{lib, ...}: {
  imports = [
    # Always enabled
    ./home-manager
    ./packages

    # Toggleable (see below)
    ./alacritty
    ./dunst
    ./extraDotfiles
    ./flatpak
    ./git
    ./gtk
    ./htop
    ./hyprland
    ./misc
    ./nvim
    ./pointerCursor
    ./scripts
    ./tmux
    ./waybar
    ./zsh
  ];

  alacrittyModule.enable =
    lib.mkDefault true;
  dunstModule.enable =
    lib.mkDefault true;
  extraDotfilesModule.enable =
    lib.mkDefault true;
  flatpakModule.enable =
    lib.mkDefault true;
  gitModule.enable =
    lib.mkDefault true;
  gtkModule.enable =
    lib.mkDefault true;
  htopModule.enable =
    lib.mkDefault true;
  hyprlandModule.enable =
    lib.mkDefault true;
  miscModule.enable =
    lib.mkDefault true;
  nvimModule.enable =
    lib.mkDefault true;
  pointerCursorModule.enable =
    lib.mkDefault true;
  scriptsModule.enable =
    lib.mkDefault true;
  tmuxModule.enable =
    lib.mkDefault true;
  waybarModule.enable =
    lib.mkDefault true;
  zshModule.enable =
    lib.mkDefault true;
}
