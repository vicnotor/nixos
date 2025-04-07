{
  lib,
  config,
  pkgs,
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
        export GDK_SCALE=1 # Add this if the content of xwayland windows is too small
      '';
      ".config/onedrive/config".text = ''
        sync_dir="~/personal"
        skip_dir=".git"
      '';
      ".config/rofi/config.rasi".text = ''
        @theme "${pkgs.rofi-wayland}/share/rofi/themes/arthur.rasi"
      '';
    };
  };
}
