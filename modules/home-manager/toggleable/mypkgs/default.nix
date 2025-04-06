{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  options = {
    mypkgsModule.enable =
      lib.mkEnableOption "enables mypkgs module";
  };

  config = lib.mkIf config.mypkgsModule.enable {
    home.packages = [
      inputs.mydev.packages.${pkgs.system}.default
    ];
  };
}
