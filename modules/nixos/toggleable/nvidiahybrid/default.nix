{
  lib,
  config,
  ...
}: {
  options = {
    nvidiahybridModule.enable =
      lib.mkEnableOption "nvidiahybrid module";
  };

  config = lib.mkIf config.nvidiahybridModule.enable {
    hardware = {
      nvidia = {
        prime = {
          offload = {
            enable = false;
            enableOffloadCmd = false;
          };
          sync.enable = true;
          intelBusId = "PCI:0:2:0";
          nvidiaBusId = "PCI:1:0:0";
        };
      };
    };

    specialisation = {
      # Enable a second boot entry with nvidia offload instead of sync when having
      # a dual gpu setup
      nvidia-offload.configuration = {
        environment.etc."specialisation".text = "nvidia-offload"; # Needed for nh (see https://github.com/nix-community/nh#specialisations-support)
        system.nixos.tags = ["nvidia-offload"];
        hardware.nvidia = {
          prime = {
            offload = {
              enable = lib.mkForce true;
              enableOffloadCmd = lib.mkForce true;
            };
            sync.enable = lib.mkForce false;
          };
        };
      };
    };
  };
}
