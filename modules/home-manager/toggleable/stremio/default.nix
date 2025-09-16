{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    stremioModule.enable =
      lib.mkEnableOption "Stremio module";
  };

  config = lib.mkIf config.stremioModule.enable {
    home.packages = [(pkgs.callPackage ./stremio.nix {})];
  };
}
