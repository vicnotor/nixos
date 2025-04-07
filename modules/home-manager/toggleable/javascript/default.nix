{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    javascriptModule.enable =
      lib.mkEnableOption "Javascript module";
  };

  config = lib.mkIf config.javascriptModule.enable {
    home.packages = with pkgs;
      [
        nodejs
        typescript-language-server
      ];
  };
}
