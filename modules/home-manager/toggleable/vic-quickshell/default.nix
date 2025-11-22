{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  options = {
    vic-quickshellModule.enable =
      lib.mkEnableOption "Vic's Quickshell module";
  };

  config = lib.mkIf config.vic-quickshellModule.enable {
    home.packages = [
      inputs.vic-quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
