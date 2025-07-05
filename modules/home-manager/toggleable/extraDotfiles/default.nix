{
  lib,
  config,
  ...
}: {
  options = {
    extraDotfilesModule.enable =
      lib.mkEnableOption "module for all extra little dotfiles";
  };

  config = lib.mkIf config.extraDotfilesModule.enable {
    home.file = {
      ".config/uwsm/env".text = ''
        export XCURSOR_THEME,BreezeX-RosePine-Linux
        export XCURSOR_SIZE,20
        export AQ_DRM_DEVICES="/dev/dri/card1:/dev/dri/card0"
        export GDK_SCALE=1 # Change this to 2 if content of xwayland windows is too small
      '';
      ".config/onedrive/config".text = ''
        sync_dir="~/personal"
        skip_dir=".git"
      '';
      # If using Dolphin:
      # ".config/xdg-desktop-portal/hyprland-portals.conf".text = ''
      #   [preferred]
      #   default = hyprland;gtk
      #   org.freedesktop.impl.portal.FileChooser = kde
      # '';
    };
  };
}
