{
  lib,
  config,
  ...
}: {
  options = {
    laptopModule.enable =
      lib.mkEnableOption "enables module with some laptop-specific settings";
  };

  config = lib.mkIf config.laptopModule.enable {
    powerManagement.enable = true;
    services = {
      thermald.enable = true;
      auto-cpufreq.enable = true;
      auto-cpufreq.settings = {
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
