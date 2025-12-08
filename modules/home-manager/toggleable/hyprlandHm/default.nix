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
      ".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "${home}/Git/vicnotor/nixos/modules/home-manager/toggleable/hyprlandHm";
    };

    home.packages = with pkgs; [
      grimblast # Hyprland wrapper for grim and slurp
      hyprpicker # Color picker
      hyprprop # xprop for Hyprland
      hyprpaper
      inputs.hyprshutdown.packages.${pkgs.stdenv.hostPlatform.system}.default
      hyprlock
    ];
  };
}
