{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pythonModule.enable =
      lib.mkEnableOption "Python module";
  };

  config = lib.mkIf config.pythonModule.enable {
    home.packages = [
      (pkgs.python3.withPackages (ps:
        with ps; [
          markitdown

          # Markdown formatting
          mdformat
          mdformat-frontmatter
          mdformat-gfm
        ]))
    ];
  };
}
