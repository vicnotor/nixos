{...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
    "${
      builtins.fetchTarball {
        url = "https://github.com/nix-community/disko/archive/master.tar.gz";
        sha256 = "sha256:0ppaj3kyj6b1fg8pqh332d5hcrmhrpw7cmn2p6qbw0bw37fmrb0g";
      }
    }/module.nix"
    ./disk-config.nix
  ];

  networking.hostName = "jake";
  system.stateVersion = "25.05"; # WARNING: NEVER CHANGE!!!!!!!!!!! See https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion

  # Enabling/disabling modules inside <FLAKE_ROOT>/modules/nixos/toggleable
  acer-wmi-batteryModule.enable = true;
}
