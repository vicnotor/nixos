{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    fontsModule.enable =
      lib.mkEnableOption "fonts module";
  };

  config = lib.mkIf config.fontsModule.enable {
    fonts = {
      enableDefaultPackages = true;
      packages = with pkgs; [
        nerd-fonts.jetbrains-mono
        nerd-fonts.ubuntu
        nerd-fonts.ubuntu-mono
        nerd-fonts.ubuntu-sans
        noto-fonts-emoji
        helvetica-neue-lt-std
        lmodern
        libertine
        corefonts # Microsoft
        vista-fonts # Microsoft
      ];

      fontconfig = {
        defaultFonts = {
          serif = ["Ubuntu Nerd Font"];
          sansSerif = ["UbuntuSans Nerd Font"];
          monospace = ["JetBrainsMono Nerd Font"];
          emoji = ["Noto Color Emoji"];
        };
      };
    };
  };
}
