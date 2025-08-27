{config, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
    "${
      builtins.fetchTarball {
        url = "https://github.com/nix-community/disko/archive/master.tar.gz";
        sha256 = "sha256:04y9xcczbd6lyk5rqilkvhw4dd1w01vzrk602pbd4c4bv5b33zwa";
      }
    }/module.nix"
    ./disk-config.nix
  ];

  networking.hostName = "nixlap";
  system.stateVersion = "25.05"; # NEVER CHANGE!!!!!!!!!!! See https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion

  boot.extraModulePackages = [(config.boot.kernelPackages.callPackage ./acer-wmi-battery/default.nix {})];
  boot.kernelModules = ["acer-wmi-battery"];
  boot.extraModprobeConfig = ''
    options acer-wmi-battery enable_health_mode=1
  '';

  btrfs-maintenanceModule.enable = true;
}
