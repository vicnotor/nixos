{
  lib,
  config,
  pkgs,
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
          enable = true;
          finegrained = false;
        };
        open = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.beta;
      };
    };

    services.xserver = {
      videoDrivers = ["nvidia"];
    };

    environment.systemPackages = with pkgs; [
      egl-wayland
    ];

    boot.kernelParams = ["nvidia.NVreg_PreserveVideoMemoryAllocations=1"];
  };
}
