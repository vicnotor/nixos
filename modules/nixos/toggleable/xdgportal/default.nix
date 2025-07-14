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
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
        kdePackages.xdg-desktop-portal-kde
      ];
    };
  };
}
