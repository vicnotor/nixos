{
  lib,
  config,
  ...
}: {
  options = {
    rofiModule.enable =
      lib.mkEnableOption "rofi module";
  };

  config = lib.mkIf config.rofiModule.enable {
    programs.rofi = {
      enable = true;
      theme = "/home/vic/Git/vicnotor/nixos/modules/home-manager/toggleable/rofi/default.rasi";
    };
  };
}
