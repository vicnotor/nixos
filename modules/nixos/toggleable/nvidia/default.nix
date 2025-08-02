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
    services.xserver.videoDrivers = ["nvidia"];
    hardware = {
      nvidia = {
        modesetting.enable = true;
        powerManagement.enable = true;
        open = true;
        package = config.boot.kernelPackages.nvidiaPackages.beta;
      };
    };

    environment.systemPackages = with pkgs; [
      egl-wayland
    ];
  };
}
