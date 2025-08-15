{pkgs, ...}: {
  imports = [../../modules/home-manager];

  home.stateVersion = "25.05"; # NOTE: CHANGE BASED ON NIXOS INSTALL ISO VERSION

  latexModule.enable = false;
  libreofficeModule.enable = false;
  minecraftModule.enable = false;
  mpvModule.enable = false;

  # Browser
  zenModule.enable = false;
  home.packages = [pkgs.firefox];
}
