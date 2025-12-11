{inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
    inputs.disko.nixosModules.disko
    ./disk-config.nix
  ];

  networking.hostName = "jake";
  system.stateVersion = "25.05"; # WARNING: NEVER CHANGE!!!!!!!!!!! See https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion

  # Enabling/disabling modules inside <FLAKE_ROOT>/modules/nixos/toggleable
  acer-wmi-batteryModule.enable = true;
}
