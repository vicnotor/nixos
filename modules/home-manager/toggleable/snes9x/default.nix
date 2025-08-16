{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    snes9xModule.enable =
      lib.mkEnableOption "snes9x config";
  };

  config = lib.mkIf config.snes9xModule.enable {
    home.packages = with pkgs; [
      snes9x-gtk
    ];
  };
}
