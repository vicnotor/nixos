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
      pkgs.rofi
    ];
    programs.rofi = {
      enable = true;
      theme = ./launchpad.rasi;
    };
  };
}
