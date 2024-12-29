{lib, ...}: {
  imports = [
    # Always enabled
    ./nix

    # Toggleable (see below)
  ];

  nixModule.enable =
    lib.mkDefault true;
}
