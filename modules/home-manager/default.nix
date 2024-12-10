{ pkgs, lib, ... }: {

  imports = [
    ./hyprland
    ./waybar
  ];

  hyprland.enable = 
    lib.mkDefault true;
  waybar.enable = 
    lib.mkDefault true;
}
