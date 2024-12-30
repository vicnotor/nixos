{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  options = {
    ghosttyModule.enable =
      lib.mkEnableOption "enables Ghostty module";
  };

  config = lib.mkIf config.ghosttyModule.enable {
    home.packages = [
      inputs.ghostty.packages.${pkgs.system}.default
    ];
    home.file = {
      ".config/ghostty/config".text = builtins.readFile ./config;
    };
  };
}
