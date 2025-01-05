{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  options = {
    quickemuModule.enable =
      lib.mkEnableOption "enables Quickemu module";
  };

  config = lib.mkIf config.quickemuModule.enable {
    environment.systemPackages = [inputs.quickemu.packages.${pkgs.system}.default];
  };
}
