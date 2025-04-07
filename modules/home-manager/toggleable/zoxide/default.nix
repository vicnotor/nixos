{
  lib,
  config,
  ...
}: {
  options = {
    zoxideModule.enable =
      lib.mkEnableOption "Zoxide module";
  };

  config = lib.mkIf config.zoxideModule.enable {
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
      options = [
        "--cmd cd"
      ];
    };
  };
}
