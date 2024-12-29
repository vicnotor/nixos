{
  lib,
  config,
  ...
}: {
  options = {
    miscModule.enable =
      lib.mkEnableOption "enables module with all miscellaneous home-manager stuff";
  };

  config =
    lib.mkIf config.miscModule.enable {
    };
}
