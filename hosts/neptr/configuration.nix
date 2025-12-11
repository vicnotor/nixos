{inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
    inputs.disko.nixosModules.disko
    ./disk-config.nix
  ];

  networking.hostName = "neptr";
  system.stateVersion = "25.05"; # WARNING: CHANGE BASED ON NIXOS INSTALL ISO VERSION

  nix.settings = {
    max-jobs = 2;
  };

  # Enabling/disabling modules inside <FLAKE_ROOT>/modules/nixos/toggleable
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
  virtualisation-guestModule.enable = true;
}
