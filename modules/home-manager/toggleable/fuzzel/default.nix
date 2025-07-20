{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    fuzzelModule.enable =
      lib.mkEnableOption "Fuzzel module";
  };

  config = lib.mkIf config.fuzzelModule.enable {
    home.packages = [pkgs.fuzzel];
  };
}
