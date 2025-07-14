{
  lib,
  config,
  inputs,
  ...
}: let
  system = "x86_64-linux";
in {
  options = {
    zenModule.enable =
      lib.mkEnableOption "Zen browser module";
  };

  config = lib.mkIf config.zenModule.enable {
    home.packages = [inputs.zen-browser.packages."${system}".twilight];
  };
}
