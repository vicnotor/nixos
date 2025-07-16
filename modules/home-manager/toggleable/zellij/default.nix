{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    zellijModule.enable =
      lib.mkEnableOption "Zellij module";
  };

  config = lib.mkIf config.zellijModule.enable {
    programs.zellij = {
      enable = true;
    };
  };
}
