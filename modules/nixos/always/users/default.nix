{lib, ...}: {
  imports = [
    ./vic.nix
  ];

  # All enabled users
  vic.enable = lib.mkDefault true;
}
