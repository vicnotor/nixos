{...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
    "${builtins.fetchTarball "https://github.com/nix-community/disko/archive/master.tar.gz"}/module.nix"
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
