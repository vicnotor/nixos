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

  hyprland.enable =
    lib.mkDefault true;
  waybar.enable =
    lib.mkDefault true;
  extraDotfiles.enable =
    lib.mkDefault true;
  zsh.enable =
    lib.mkDefault true;
  tmux.enable =
    lib.mkDefault true;
  dunst.enable =
    lib.mkDefault true;
  alacritty.enable =
    lib.mkDefault true;
  htop.enable =
    lib.mkDefault true;
  scripts.enable =
    lib.mkDefault true;
  nvim.enable =
    lib.mkDefault true;
  gtk.enable =
    lib.mkDefault true;
}
