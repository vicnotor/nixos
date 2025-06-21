{
  lib,
  config,
  ...
}: {
  options = {
    laptopModule.enable =
      lib.mkEnableOption "module with some laptop-specific settings";
  };

  config = lib.mkIf config.laptopModule.enable {
    powerManagement.enable = true;
    services.thermald.enable = true;
    programs.auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";
        };
        charger = {
          governor = "performance";
          turbo = "auto";
        };
      };
    };
  };
}
