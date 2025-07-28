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
    environment.systemPackages = [
      inputs.quickshell.packages.${pkgs.system}.default
      pkgs.kdePackages.qtdeclarative # Contains qmlls and qmllint
    ];
  };
}
