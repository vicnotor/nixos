{lib, ...}: {
  imports = [
    ./hyprland
    ./waybar
    ./extraDotfiles
    ./zsh
    ./tmux
    ./dunst
    ./alacritty
    ./htop
    ./scripts
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
}
