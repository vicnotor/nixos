{
  lib,
  config,
  pkgs,
  ...
}:
with pkgs; let
  R-with-packages = rWrapper.override {
    packages = with rPackages; [
      languageserver
      ggplot2
      dplyr
      deSolve
      rootSolve
      coda
      FME
    ];
  };
in {
  options = {
    rModule.enable =
      lib.mkEnableOption "enables R module";
  };

  config = lib.mkIf config.rModule.enable {
    home.packages = [R-with-packages];
    home.file = {
      ".Rprofile".source = config.lib.file.mkOutOfStoreSymlink ./.Rprofile;
    };
  };
}
