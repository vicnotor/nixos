{...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/default.nix
  ];

  # DO NOT CHANGE!!!!!!!!!!! See https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion
  system.stateVersion = "24.11";
}
