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
    home = {
      packages = [
        inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
        pkgs.kdePackages.qtdeclarative # Contains qmlls and qmllint
      ];
      file = {
        ".config/quickshell".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Git/vicnotor/nixos/modules/home-manager/toggleable/quickshell/config";
      };
    };
    qt.enable = true;
  };
}
