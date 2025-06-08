{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nvidiaModule.enable =
      lib.mkEnableOption "nvidia module";
  };

  config = lib.mkIf config.nvidiaModule.enable {
    hardware = {
      nvidia = {
        modesetting.enable = true;
        powerManagement.enable = true;
        open = true;
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
