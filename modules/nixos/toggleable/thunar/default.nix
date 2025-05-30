{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    thunarModule.enable =
      lib.mkEnableOption "thunar module";
  };

  config = lib.mkIf config.thunarModule.enable {
    services = {
      gvfs = {
        enable = true; # Mount, trash, and other functionalities
        package = pkgs.gnome.gvfs;
      };
      tumbler.enable = true; # Thumbnail support for images
    };
    programs.thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
  };
}
