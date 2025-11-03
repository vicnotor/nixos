{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  options = {
    quickemuModule.enable =
      lib.mkEnableOption "Quickemu module";
  };

  config = lib.mkIf config.quickemuModule.enable {
    environment.systemPackages = [
      inputs.quickemu.packages.${pkgs.stdenv.hostPlatform.system}.default
      inputs.quickgui.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
