{
  lib,
  config,
  ...
}: {
  options = {
    nvidiaModule.enable =
      lib.mkEnableOption "enables nvidia module";
  };

  config = lib.mkIf config.nvidiaModule.enable {
    hardware = {
      nvidia = {
        modesetting.enable = true;
        powerManagement = {
          enable = false;
          finegrained = false;
        };
        open = true;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.beta;
      };
    };
    services.xserver = {
      videoDrivers = ["nvidia"];
    };
  };
}
