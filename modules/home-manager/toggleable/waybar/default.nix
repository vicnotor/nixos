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
    programs.waybar = {
      enable = true;
      systemd.enable = true;
      package = (
        inputs.waybar.packages.${pkgs.stdenv.hostPlatform.system}.waybar.overrideAttrs
        (oldAttrs: {
          mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
        })
      );
    };
    home = {
      file = {
        ".config/waybar/style.css".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Git/vicnotor/nixos/modules/home-manager/toggleable/waybar/style.css";
        ".config/waybar/config".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Git/vicnotor/nixos/modules/home-manager/toggleable/waybar/config";
      };
    };
  };
}
