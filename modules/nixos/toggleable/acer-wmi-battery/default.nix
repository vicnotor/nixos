{
  lib,
  config,
  ...
}: {
  options = {
    acer-wmi-batteryModule.enable =
      lib.mkEnableOption "Acer wmi battery module";
  };

  config = lib.mkIf config.acer-wmi-batteryModule.enable {
    boot = {
      extraModulePackages = with config.boot.kernelPackages; [
        acer-wmi-battery
      ];
      kernelModules = ["acer-wmi-battery"];
      extraModprobeConfig = ''
        options acer-wmi-battery enable_health_mode=1
      '';
    };
  };
}
