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

  networking.hostName = "nixlap";
  system.stateVersion = "25.05"; # WARNING: NEVER CHANGE!!!!!!!!!!! See https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion

  nix.settings = {
    max-jobs = 6;
  };
}
