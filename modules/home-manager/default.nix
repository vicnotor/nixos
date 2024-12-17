{ pkgs, lib, ... }: {

  imports = [
    ./hyprland
    ./waybar
    ./dotfiles
    ./zsh
    ./tmux
    ./dunst
    ./alacritty
  ];

  hyprland.enable = 
    lib.mkDefault true;
  waybar.enable = 
    lib.mkDefault true;
  dotfiles.enable = 
    lib.mkDefault true;
  zsh.enable = 
    lib.mkDefault true;
  tmux.enable = 
    lib.mkDefault true;
  dunst.enable = 
    lib.mkDefault true;
  alacritty.enable = 
    lib.mkDefault true;
}
