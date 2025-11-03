{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  options = {
    my-quickshellModule.enable =
      lib.mkEnableOption "My Quickshell module";
  };

  config = lib.mkIf config.my-quickshellModule.enable {
    home.packages = [
      inputs.my-quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
