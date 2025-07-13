{
  lib,
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.zen-browser.homeModules.beta
    # or inputs.zen-browser.homeModules.twilight
    # or inputs.zen-browser.homeModules.twilight-official
  ];

  options = {
    zen-browserModule.enable =
      lib.mkEnableOption "Zen-browser module";
  };

  config = lib.mkIf config.zen-browserModule.enable {
    programs.zen-browser = {
      enable = true;
    };
  };
}
