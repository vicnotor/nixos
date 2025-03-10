{
  lib,
  config,
  ...
}: {
  options = {
    nvidiahybridModule.enable =
      lib.mkEnableOption "enables nvidiahybrid module";
  };

  config = lib.mkIf config.nvidiahybridModule.enable {
    hardware = {
      nvidia = {
        prime = {
          offload = {
            enable = true;
            enableOffloadCmd = true;
          };
          intelBusId = "PCI:0:2:0";
          nvidiaBusId = "PCI:1:0:0";
        };
      };
    };

    # Enable a second boot entry with nvidia sync instead of offload when having
    # a dual gpu setup
    specialisation = {
      # Nvidia sync specialisation
      nvidia-sync.configuration = {
        system.nixos.tags = ["nvidia-sync"];
        hardware.nvidia = {
          prime = {
            offload = {
              enable = lib.mkForce false;
              enableOffloadCmd = lib.mkForce false;
            };
            sync.enable = lib.mkForce true;
          };
        };
        nvidia-reverseSync.configuration = {
          system.nixos.tags = ["nvidia-sync"];
          hardware.nvidia = {
            prime = {
              offload = {
                enable = lib.mkForce false;
                enableOffloadCmd = lib.mkForce false;
              };
              sync.enable = lib.mkForce false;
              reverseSync.enable = lib.mkForce true;
            };
          };
        };
      };
    };
  };
}
