{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    haskellModule.enable =
      lib.mkEnableOption "enables Haskell module";
  };

  config = lib.mkIf config.haskellModule.enable {
    home.packages = [
      (pkgs.haskellPackages.ghcWithPackages
        (ps: with ps; [cabal-install]))
    ];
  };
}
