{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pythonModule.enable =
      lib.mkEnableOption "enables Python module";
  };

  config = lib.mkIf config.pythonModule.enable {
    home.packages = [
      (pkgs.python3.withPackages (ps:
        with ps; [
          m2crypto # Needed for Python SSL support
          numpy
        ]))
    ];
  };
}
