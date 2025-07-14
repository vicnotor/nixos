{...}: {
  imports = [./flatpak.nix];

  services.flatpak.enable = true;
}
