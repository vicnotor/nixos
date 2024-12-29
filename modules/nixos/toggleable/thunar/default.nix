{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    thunarModule.enable =
      lib.mkEnableOption "enables thunar module";
  };

  config = lib.mkIf config.thunarModule.enable {
    services = {
      gvfs.enable = true; # Mount, trash, and other functionalities
      tumbler.enable = true; # Thumbnail support for images
    };
    programs.thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
      ];
    };
  };
}
