{config, ...}: let
  acer-wmi-battery = config.boot.kernelPackages.callPackage ./acer-wmi-battery/default.nix {};
in {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
  ];

  boot.extraModulePackages = [acer-wmi-battery];
}
