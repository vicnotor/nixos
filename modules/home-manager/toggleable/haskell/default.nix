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
        (ps:
          with ps; [
            cabal-install
            haskell-language-server

            # For gloss projects (should move this to dev shells)
            gloss
            OpenGLRaw
            GLUT
            GLURaw
          ]))
    ];
  };
}
