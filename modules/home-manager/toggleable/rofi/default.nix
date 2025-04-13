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
    home.packages = [
      pkgs.rofi-wayland
    ];
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      theme = ./launchpad.rasi;
    };
  };
}
