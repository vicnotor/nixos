{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: let
  home = config.home.homeDirectory;
in {
  options = {
    hyprlandHmModule.enable =
      lib.mkEnableOption "hyprland home-manager module";
  };

  config = lib.mkIf config.hyprlandHmModule.enable {
    home.file = {
      ".config/hypr/hyprland.conf".source = config.lib.file.mkOutOfStoreSymlink "${home}/Git/vicnotor/nixos/modules/home-manager/toggleable/hyprlandHm/hyprland.conf";
      ".config/hypr/conf".source = config.lib.file.mkOutOfStoreSymlink "${home}/Git/vicnotor/nixos/modules/home-manager/toggleable/hyprlandHm/conf";
      ".config/hypr/hyprpaper.conf".source = config.lib.file.mkOutOfStoreSymlink "${home}/Git/vicnotor/nixos/modules/home-manager/toggleable/hyprlandHm/hyprpaper.conf";
    };

    home.packages = with pkgs; [
      grimblast # Hyprland wrapper for grim and slurp
      hyprpicker # Color picker
      hyprprop # xprop for Hyprland
      hyprpaper
    ];

    # services.hyprpaper = {
    #   enable = true;
    #   package = inputs.hyprpaper.packages.${pkgs.stdenv.hostPlatform.system}.default;
    #   settings = {
    #     # CHANGE THIS FOR DEFAULT WALLPAPER, ALONG WITH $HOME/Git/vicnotor/nixos/modules/home-manager/toggleable/zsh/default.nix
    #     preload = ["${home}/personal/Pictures/wallpapers/cats.jpg"];
    #     wallpaper = [",${home}/personal/Pictures/wallpapers/cats.jpg"];
    #   };
    # };
  };
}
