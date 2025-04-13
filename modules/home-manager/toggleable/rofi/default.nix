{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    rofiModule.enable =
      lib.mkEnableOption "rofi module";
  };

  config = lib.mkIf config.rofiModule.enable {
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      theme = ./launchpad.rasi;
    };
  };
}
