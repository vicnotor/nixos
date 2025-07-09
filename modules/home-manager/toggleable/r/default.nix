{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    rModule.enable =
      lib.mkEnableOption "R module";
  };

  config = lib.mkIf config.rModule.enable {
    home.packages = [pkgs.R];
  };
}
