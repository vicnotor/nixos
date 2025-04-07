{
  lib,
  config,
  pkgs,
  ...
}:
with pkgs; let
  R-with-packages = rWrapper.override {
    packages = with rPackages; [
      coda
      deSolve
      dplyr
      plot3D
      rmarkdown
      rootSolve
      tidyverse
      FME
      ggplot2
      languageserver
    ];
  };
in {
  options = {
    rModule.enable =
      lib.mkEnableOption "enables R module";
  };

  config = lib.mkIf config.rModule.enable {
    home.packages = [R-with-packages];
  };
}
