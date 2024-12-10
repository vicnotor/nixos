{ pkgs, lib, ... }: {

  imports = [
    ./hyprland/hyprland.nix
  ];

  hyprland.enable = 
    lib.mkDefault true;
}
