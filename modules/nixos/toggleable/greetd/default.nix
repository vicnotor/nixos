{
  config,
  lib,
  ...
}: {
  options.greetdModule = {
    enable = lib.mkEnableOption "greetd and ReGreet module";
  };

  config = lib.mkIf config.greetdModule.enable {
    services.greetd.enable = true;
    programs.regreet.enable = true;
  };
}
