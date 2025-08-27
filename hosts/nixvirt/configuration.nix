{...}: {
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

  networking.hostName = "nixvirt";
  system.stateVersion = "25.05"; # WARNING: CHANGE BASED ON NIXOS INSTALL ISO VERSION

  nix.settings = {
    cores = 2;
    max-jobs = 2;
  };

  virtualisation-guestModule.enable = true;

  bluetoothModule.enable = false;
  graphicsModule.enable = false;
  keydModule.enable = false;
  laptopModule.enable = false;
  nvidiaModule.enable = false;
  nvidiahybridModule.enable = false;
  ssdModule.enable = false;
  steamModule.enable = false;
  tailscaleModule.enable = false;
  virtualisationModule.enable = false;
}
