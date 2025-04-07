{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    graphicsModule.enable =
      lib.mkEnableOption "graphics (opengl) module";
  };

  config = lib.mkIf config.graphicsModule.enable {
    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [
          nvidia-vaapi-driver
          intel-media-driver # LIBVA_DRIVER_NAME=iHD
          libvdpau-va-gl
        ];
      };
    };
    # environment.sessionVariables = {LIBVA_DRIVER_NAME = "iHD";}; # Force intel-media-driver
  };
}
