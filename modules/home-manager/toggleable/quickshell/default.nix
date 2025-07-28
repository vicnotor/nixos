{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  options = {
    quickshellModule.enable =
      lib.mkEnableOption "Quickshell module";
  };

  config = lib.mkIf config.quickshellModule.enable {
    home.packages = [
      inputs.quickshell.packages.${pkgs.system}.default
      pkgs.kdePackages.qtdeclarative # Contains qmlls and qmllint
    ];
  };
}
