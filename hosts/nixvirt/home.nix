{...}: {
  imports = [../../modules/home-manager];

  home.stateVersion = "25.05"; # NOTE: CHANGE BASED ON NIXOS INSTALL ISO VERSION

  minecraftModule.enable = false;
}
