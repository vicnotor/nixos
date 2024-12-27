{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    extraDotfilesModule.enable =
      lib.mkEnableOption "enables importing of all extraa little dotfiles";
  };

  config = lib.mkIf config.extraDotfilesModule.enable {
    home.file = {
      # Setting file contents immediately:
      ".config/uwsm/env".text = ''
        export XCURSOR_THEME,BreezeX-RosePine-Linux
        export XCURSOR_SIZE,20
        export AQ_DRM_DEVICES="/dev/dri/renderD129;/dev/dri/renderD128"
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
