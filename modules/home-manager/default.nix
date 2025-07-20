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
    ./toggleable/fuzzel
    ./toggleable/fzf
    ./toggleable/ghostty
    ./toggleable/git
    ./toggleable/gtk
    ./toggleable/htop
    ./toggleable/hyprlandHm
    ./toggleable/latex
    ./toggleable/mpv
    ./toggleable/mypkgs
    ./toggleable/nix-index
    ./toggleable/nvim
    ./toggleable/pointerCursor
    ./toggleable/python
    ./toggleable/r
    ./toggleable/rofi
    ./toggleable/stylixHm
    ./toggleable/tmux
    ./toggleable/waybar
    ./toggleable/zellij
    ./toggleable/zoxide
    ./toggleable/zen
    ./toggleable/zsh
  ];

  # Enabled by default
  alacrittyModule.enable = lib.mkDefault true;
  btopModule.enable = lib.mkDefault true;
  direnvModule.enable = lib.mkDefault true;
  dunstModule.enable = lib.mkDefault true;
  extraDotfilesModule.enable = lib.mkDefault true;
  fuzzelModule.enable = lib.mkDefault true;
  fzfModule.enable = lib.mkDefault true;
  ghosttyModule.enable = lib.mkDefault true;
  gitModule.enable = lib.mkDefault true;
  hyprlandHmModule.enable = lib.mkDefault true;
  latexModule.enable = lib.mkDefault true;
  mpvModule.enable = lib.mkDefault true;
  mypkgsModule.enable = lib.mkDefault true;
  nix-indexModule.enable = lib.mkDefault true;
  nvimModule.enable = lib.mkDefault true;
  pythonModule.enable = lib.mkDefault true;
  rModule.enable = lib.mkDefault true;
  rofiModule.enable = lib.mkDefault true;
  stylixHmModule.enable = lib.mkDefault true;
  tmuxModule.enable = lib.mkDefault true;
  waybarModule.enable = lib.mkDefault true;
  zoxideModule.enable = lib.mkDefault true;
  zenModule.enable = lib.mkDefault true;
  zshModule.enable = lib.mkDefault true;

  # Disabled by default
  gtkModule.enable = lib.mkDefault false; # Not needed because of Stylix
  htopModule.enable = lib.mkDefault false;
  pointerCursorModule.enable = lib.mkDefault false; # Not needed because of Stylix
  zellijModule.enable = lib.mkDefault false;
}
