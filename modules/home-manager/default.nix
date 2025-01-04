{lib, ...}: {
  imports = [
    # Always enabled
    ./always/home-manager
    ./always/packages
    ./always/scripts

    # Toggleable (see below)
    ./toggleable/alacritty
    ./toggleable/btop
    ./toggleable/direnv
    ./toggleable/dunst
    ./toggleable/extraDotfiles
    ./toggleable/fzf
    ./toggleable/ghostty
    ./toggleable/git
    ./toggleable/gtk
    ./toggleable/htop
    ./toggleable/hyprland
    ./toggleable/misc
    ./toggleable/mpv
    ./toggleable/nvim
    ./toggleable/pointerCursor
    ./toggleable/python
    ./toggleable/r
    ./toggleable/stylixHm
    ./toggleable/tmux
    ./toggleable/waybar
    ./toggleable/yazi
    ./toggleable/zoxide
    ./toggleable/zsh
  ];

  # Enabled by default
  alacrittyModule.enable = lib.mkDefault true;
  btopModule.enable = lib.mkDefault true;
  direnvModule.enable = lib.mkDefault true;
  dunstModule.enable = lib.mkDefault true;
  extraDotfilesModule.enable = lib.mkDefault true;
  fzfModule.enable = lib.mkDefault true;
  ghosttyModule.enable = lib.mkDefault true;
  gitModule.enable = lib.mkDefault true;
  hyprlandModule.enable = lib.mkDefault true;
  miscModule.enable = lib.mkDefault true;
  mpvModule.enable = lib.mkDefault true;
  nvimModule.enable = lib.mkDefault true;
  pythonModule.enable = lib.mkDefault true;
  rModule.enable = lib.mkDefault true;
  stylixHmModule.enable = lib.mkDefault true;
  tmuxModule.enable = lib.mkDefault true;
  waybarModule.enable = lib.mkDefault true;
  yaziModule.enable = lib.mkDefault true;
  zoxideModule.enable = lib.mkDefault true;
  zshModule.enable = lib.mkDefault true;

  # Disabled by default
  gtkModule.enable = lib.mkDefault false; # Not needed because of Stylix
  htopModule.enable = lib.mkDefault false;
  pointerCursorModule.enable = lib.mkDefault false; # Not needed because of Stylix
}
