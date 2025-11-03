{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  options = {
    zenModule.enable =
      lib.mkEnableOption "Zen browser module";
  };

  config = lib.mkIf config.zenModule.enable {
    home.packages = [inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".twilight];
  };
}
