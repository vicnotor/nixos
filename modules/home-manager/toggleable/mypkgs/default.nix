{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  options = {
    mypkgsModule.enable =
      lib.mkEnableOption "mypkgs module for all own made packages with a flake.nix file";
  };

  config = lib.mkIf config.mypkgsModule.enable {
    home.packages = [
      inputs.nix-devshells.packages.${pkgs.system}.default
    ];
  };
}
