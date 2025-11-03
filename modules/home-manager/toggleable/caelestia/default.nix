{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  options = {
    caelestiaModule.enable =
      lib.mkEnableOption "Caelestia module";
  };

  config = lib.mkIf config.caelestiaModule.enable {
    home.packages = [
      inputs.caelestia.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
