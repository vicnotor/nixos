{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    xdgportalModule.enable =
      lib.mkEnableOption "xdg portal settings module";
  };

  config = lib.mkIf config.xdgportalModule.enable {
    xdg.portal = {
      enable = true;
      wlr.enable = true;
      xdgOpenUsePortal = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-gnome
        pkgs.kdePackages.xdg-desktop-portal-kde
      ];
    };
  };
}
