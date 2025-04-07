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
            enable = true;
            enableOffloadCmd = true;
          };
          intelBusId = "PCI:0:2:0";
          nvidiaBusId = "PCI:1:0:0";
        };
      };
    };

    specialisation = {
      # Enable a second boot entry with nvidia sync instead of offload when having
      # a dual gpu setup
      nvidia-sync.configuration = {
        environment.etc."specialisation".text = "nvidia-sync"; # Needed for nh (see https://github.com/nix-community/nh#specialisations-support)
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
      };
    };
  };
}
