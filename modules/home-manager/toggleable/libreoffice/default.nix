{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    libreofficeModule.enable =
      lib.mkEnableOption "Libreoffice module";
  };

  config = lib.mkIf config.libreofficeModule.enable {
    home.packages = with pkgs; [
      libreoffice
      hunspell
      hunspellDicts.en_US
      hunspellDicts.nl_NL
    ];
  };
}
