{lib, ...}: {
  imports = [
    # Always enabled
    ./always/home-manager
    ./always/packages

    # Toggleable (see below)
    ./toggleable/alacritty
    ./toggleable/dunst
    ./toggleable/extraDotfiles
    ./toggleable/git
    ./toggleable/gtk
    ./toggleable/htop
    ./toggleable/hyprland
    ./toggleable/misc
    ./toggleable/nvim
    ./toggleable/pointerCursor
    ./toggleable/scripts
    ./toggleable/tmux
    ./toggleable/waybar
    ./toggleable/zsh
  ];

  alacrittyModule.enable = lib.mkDefault true;
  dunstModule.enable = lib.mkDefault true;
  extraDotfilesModule.enable = lib.mkDefault true;
  gitModule.enable = lib.mkDefault true;
  gtkModule.enable = lib.mkDefault true;
  htopModule.enable = lib.mkDefault true;
  hyprlandModule.enable = lib.mkDefault true;
  miscModule.enable = lib.mkDefault true;
  nvimModule.enable = lib.mkDefault true;
  pointerCursorModule.enable = lib.mkDefault true;
  scriptsModule.enable = lib.mkDefault true;
  tmuxModule.enable = lib.mkDefault true;
  waybarModule.enable = lib.mkDefault true;
  zshModule.enable = lib.mkDefault true;
}
