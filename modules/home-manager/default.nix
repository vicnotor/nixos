{ pkgs, lib, ... }: {

  imports = [
    ./hyprland
    ./waybar
    ./dotfiles
    ./zsh
  ];

  hyprland.enable = 
    lib.mkDefault true;
  waybar.enable = 
    lib.mkDefault true;
  dotfiles.enable = 
    lib.mkDefault true;
  zsh.enable = 
    lib.mkDefault true;
}
