{ pkgs, lib, ... }: {

  imports = [
    ./hyprland
    ./waybar
    ./dotfiles
  ];

  hyprland.enable = 
    lib.mkDefault true;
  waybar.enable = 
    lib.mkDefault true;
  dotfiles.enable = 
    lib.mkDefault true;
}
