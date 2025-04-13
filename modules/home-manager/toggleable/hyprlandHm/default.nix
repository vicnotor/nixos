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
      ".config/hypr/shart.sh".source = config.lib.file.mkOutOfStoreSymlink ./start.sh;
      ".config/hypr/hyprland.conf".source = config.lib.file.mkOutOfStoreSymlink ./hyprland.conf;
    };
  };
}
