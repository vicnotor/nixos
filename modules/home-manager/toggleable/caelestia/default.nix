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
    environment.systemPackages = [
      inputs.caelestia.packages.${pkgs.system}.default
    ];
  };
}
