{
  lib,
  config,
  pkgs,
  ...
}: let
  # scheme = "tokyo-night-dark";
  # schemeFile = "${pkgs.base16-schemes}/share/themes/${scheme}.yaml";
  customSchemeFile = ./tokyonight-custom.yaml;
in {
  options = {
    stylixModule.enable =
      lib.mkEnableOption "Stylix module";
  };

  config = lib.mkIf config.stylixModule.enable {
    stylix = {
      enable = true;
      image = ./dune_2_top_down.jpeg;
      targets = {
        chromium.enable = false;
        console.enable = false;
      };
      polarity = "dark";
      base16Scheme = customSchemeFile;
      fonts = {
        serif = {
          package = pkgs.nerd-fonts.ubuntu;
          name = "Ubuntu Nerd Font";
        };

        sansSerif = {
          package = pkgs.nerd-fonts.ubuntu-sans;
          name = "UbuntuSans Nerd Font";
        };

        monospace = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrainsMono Nerd Font";
        };

        emoji = {
          package = pkgs.noto-fonts-emoji;
          name = "Noto Color Emoji";
        };
        sizes = {
          applications = 11;
          terminal = 13;
          desktop = 11;
          popups = 11;
        };
      };
      cursor = {
        package = pkgs.rose-pine-cursor;
        name = "BreezeX-RosePine-Linux";
        size = 20;
      };
      opacity = {
        applications = 1.0;
        terminal = 0.88;
        desktop = 0.5;
        popups = 1.0;
      };
    };
  };
}
