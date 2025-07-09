{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    latexModule.enable =
      lib.mkEnableOption "LaTeX module";
  };

  config = lib.mkIf config.latexModule.enable {
    home.packages = with pkgs; [
      texlive.combined.scheme-full
      ltex-ls-plus
      aspell # Spell checker
      aspellDicts.en
      bibclean # For BibTeX files
    ];
  };
}
