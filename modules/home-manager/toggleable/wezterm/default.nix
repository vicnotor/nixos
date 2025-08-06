{
  lib,
  config,
  ...
}: {
  options = {
    weztermModule.enable =
      lib.mkEnableOption "Wezterm module";
  };

  config = lib.mkIf config.weztermModule.enable {
    programs.wezterm = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
