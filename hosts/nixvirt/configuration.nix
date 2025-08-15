{...}: {
  imports = [
    ../../modules/nixos
    "${
      builtins.fetchTarball {
        url = "https://github.com/nix-community/disko/archive/master.tar.gz";
        sha256 = "sha256:0788zirv7d3wscp60xb5v2ah52d2lv8p8di6rb9fmka6h2f1jkm7";
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
