{...}: {
  imports = [../../modules/home-manager];

  home.stateVersion = "25.05"; # WARNING: CHANGE BASED ON NIXOS INSTALL ISO VERSION

  # Enabling/disabling modules inside <FLAKE_ROOT>/modules/home-manager/toggleable
  latexModule.enable = false;
  libreofficeModule.enable = false;
  minecraftModule.enable = false;
  mpvModule.enable = false;
  zenModule.enable = false;
}
