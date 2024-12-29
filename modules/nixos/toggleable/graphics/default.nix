{
  lib,
  config,
  ...
}: {
  options = {
    graphicsModule.enable =
      lib.mkEnableOption "enables graphics (opengl) module";
  };

  config = lib.mkIf config.graphicsModule.enable {
    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
      };
    };
  };
}
