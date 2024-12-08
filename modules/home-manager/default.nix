{ pkgs, lib, ... }: {

  imports = [
    ./main-setup/hyprland.nix
  ];

  hyprland.enable = 
    lib.mkDefault true;
}
