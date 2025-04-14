{
  lib,
  config,
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
  };
}
