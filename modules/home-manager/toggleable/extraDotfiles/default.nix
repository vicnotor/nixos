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
      ".config/rofi/launchpad.rasi".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/vicnotor/nixos/extraFiles/rofi/launchpad.rasi;
      ".config/rofi/config.rasi".text = ''
        @theme "launchpad.rasi"
      '';
    };
  };
}
