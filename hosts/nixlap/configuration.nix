{...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
    "${
      builtins.fetchTarball {
        url = "https://github.com/nix-community/disko/archive/master.tar.gz";
        sha256 = "sha256:1hrlvj0dzrrf208n8n3r6gkpfwxrqi2fgmmw1763qbw7kq34msjw";
      }
    }/module.nix"
    ./disk-config.nix
  ];

  networking.hostName = "nixlap";
  system.stateVersion = "25.05"; # WARNING: NEVER CHANGE!!!!!!!!!!! See https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion

  # Enabling/disabling modules inside <FLAKE_ROOT>/modules/nixos/toggleable
  acer-wmi-batteryModule.enable = true;
}
