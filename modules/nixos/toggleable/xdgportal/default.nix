{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    xdgportalModule.enable =
      lib.mkEnableOption "enables xdg portal settings module";
  };

  config = lib.mkIf config.xdgportalModule.enable {
    xdg.portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-gtk];
    };
  };
}
