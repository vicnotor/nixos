{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    fontsModule.enable =
      lib.mkEnableOption "enables fonts module";
  };

  config = lib.mkIf config.fontsModule.enable {
    fonts = {
      enableDefaultPackages = true;
      packages = with pkgs; [
        helvetica-neue-lt-std
        nerd-fonts.ubuntu
        nerd-fonts.ubuntu-mono
        nerd-fonts.ubuntu-sans
        noto-fonts-emoji
      ];

      fontconfig = {
        defaultFonts = {
          serif = ["Ubuntu Nerd Font"];
          sansSerif = ["UbuntuSans Nerd Font"];
          monospace = ["UbuntuMono Nerd Font"];
          emoji = ["Noto Color Emoji"];
        };
      };
    };
  };
}
