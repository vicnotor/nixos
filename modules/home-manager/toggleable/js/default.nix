{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    jsModule.enable =
      lib.mkEnableOption "JavaScript config";
  };

  config = lib.mkIf config.jsModule.enable {
    home.packages = with pkgs; [
      nodejs
      typescript-language-server
      yarn
    ];
  };
}
