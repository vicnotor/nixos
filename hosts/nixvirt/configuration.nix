{...}: {
  imports = [
    ../../modules/nixos
    "${
      builtins.fetchTarball {
        url = "https://github.com/nix-community/disko/archive/master.tar.gz";
        sha256 = "sha256-mI6Ob9BmNfwqT3nndWf3jkz8f7tV10odkTnfApsNo+A=";
      }
    }/module.nix"
    ./disk-config.nix
  ];

  networking.hostName = "nixvirt";
  system.stateVersion = "25.05"; # NOTE: CHANGE BASED ON NIXOS INSTALL ISO VERSION

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
