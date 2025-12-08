{
  lib,
  config,
  ...
}: {
  options = {
    fwupdModule.enable =
      lib.mkEnableOption "Fwupd module";
  };

  config = lib.mkIf config.fwupdModule.enable {
    services.fwupd.enable = true;
  };
}
