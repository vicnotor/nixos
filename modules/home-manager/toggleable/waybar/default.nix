{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  options = {
    waybarModule.enable =
      lib.mkEnableOption "waybar module";
  };

  config = lib.mkIf config.waybarModule.enable {
    home = {
      packages = [
        (
          inputs.waybar.packages.${pkgs.stdenv.hostPlatform.system}.waybar.overrideAttrs
          (oldAttrs: {
            mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
          })
        )
      ];
      file = {
        ".config/waybar/style.css".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Git/vicnotor/nixos/modules/home-manager/toggleable/waybar/style.css";
        ".config/waybar/config".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Git/vicnotor/nixos/modules/home-manager/toggleable/waybar/config";
      };
    };
  };
}
