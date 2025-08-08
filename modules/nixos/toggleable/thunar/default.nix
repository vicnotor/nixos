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
      gvfs.enable = true; # Mount, trash, and other functionalities
      tumbler.enable = true; # Thumbnail support for images
    };
    programs.thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
    home.file = {
      ".config/Thunar/uca/xml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Git/vicnotor/nixos/modules/nixos/toggleable/thunar/uca.xml";
    };
  };
}
