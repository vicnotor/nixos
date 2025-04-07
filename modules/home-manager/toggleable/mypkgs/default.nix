{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  options = {
    mypkgsModule.enable =
      lib.mkEnableOption "mypkgs module";
  };

  config = lib.mkIf config.mypkgsModule.enable {
    home.packages = [
      inputs.my-devshells.packages.${pkgs.system}.default
    ];
  };
}
