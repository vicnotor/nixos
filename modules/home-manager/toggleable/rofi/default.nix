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
      theme = "/home/vic/Git/vicnotor/nixos/modules/home-manager/toggleable/rofi/default.rasi";
    };
  };
}
