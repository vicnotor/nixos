{
  lib,
  config,
  ...
}: {
  options = {
    desktop-applicationsModule.enable =
      lib.mkEnableOption "desktop-applications module";
  };

  config = lib.mkIf config.desktop-applicationsModule.enable {
    home.file = {
      ".local/share/applications".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Git/vicnotor/nixos/modules/home-manager/toggleable/desktop-applications/applications";
    };
  };
}
