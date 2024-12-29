{
  lib,
  config,
  ...
}: {
  options = {
    virtualisationModule.enable =
      lib.mkEnableOption "enables virtualisation module";
  };

  config = lib.mkIf config.virtualisationModule.enable {
    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
    };
  };
}
