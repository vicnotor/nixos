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
        helvetica-neue-lt-std
        nerd-fonts.jetbrains-mono
        nerd-fonts.ubuntu
        nerd-fonts.ubuntu-mono
        nerd-fonts.ubuntu-sans
        noto-fonts-emoji
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
