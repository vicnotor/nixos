{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  options = {
    hyprlandHmModule.enable =
      lib.mkEnableOption "hyprland home-manager module";
  };

  config = lib.mkIf config.hyprlandHmModule.enable {
    home.file = {
      ".config/hypr/hyprland.conf".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Git/vicnotor/nixos/modules/home-manager/toggleable/hyprlandHm/hyprland.conf";
    };

    # Hyprpaper, I put this here because I use it for wallpapers in Hyprland
    services.hyprpaper = let
      home = config.home.homeDirectory;
    in {
      enable = true;
      package = inputs.hyprpaper.packages.${pkgs.system}.default;
      settings = {
        preload = ["${home}/personal/Pictures/wallpapers/destiny.png"];

        wallpaper = [",${home}/personal/Pictures/wallpapers/destiny.png"];
      };
    };
  };
}
