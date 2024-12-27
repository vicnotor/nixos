{lib, ...}: {
  imports = [
    # Always enabled
    ./home-manager
    ./packages

    # Toggleable (see below)
    ./hyprland
    ./waybar
    ./extraDotfiles
    ./zsh
    ./tmux
    ./dunst
    ./alacritty
    ./htop
    ./scripts
    ./nvim
    ./gtk
  ];

  hyprlandModule.enable =
    lib.mkDefault true;
  waybarModule.enable =
    lib.mkDefault true;
  extraDotfilesModule.enable =
    lib.mkDefault true;
  zshModule.enable =
    lib.mkDefault true;
  tmuxModule.enable =
    lib.mkDefault true;
  dunstModule.enable =
    lib.mkDefault true;
  alacrittyModule.enable =
    lib.mkDefault true;
  htopModule.enable =
    lib.mkDefault true;
  scriptsModule.enable =
    lib.mkDefault true;
  nvimModule.enable =
    lib.mkDefault true;
  gtkModule.enable =
    lib.mkDefault true;
}
