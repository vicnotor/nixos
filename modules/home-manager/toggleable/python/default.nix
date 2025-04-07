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
    home.packages = with pkgs;
      [
        pyright
      ]
      ++ [
        (pkgs.python3.withPackages (ps:
          with ps; [
            m2crypto # Needed for Python SSL support
            numpy
          ]))
      ];
  };
}
