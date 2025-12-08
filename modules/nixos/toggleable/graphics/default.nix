{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: let
  pkgs-hyprland = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  options = {
    graphicsModule.enable =
      lib.mkEnableOption "graphics (opengl) module";
  };

  config = lib.mkIf config.graphicsModule.enable {
    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
        package = pkgs-hyprland.mesa;
        package32 = pkgs-hyprland.mesa;
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
