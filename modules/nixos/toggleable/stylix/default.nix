{
  lib,
  config,
  pkgs,
  ...
}: let
  # scheme = "tokyo-night-dark";
  # schemeFile = "${pkgs.base16-schemes}/share/themes/${scheme}.yaml";
  customSchemeFile = ./rose-pine-custom.yaml;
in {
  options = {
    stylixModule.enable =
      lib.mkEnableOption "Stylix module";
  };

  config = lib.mkIf config.stylixModule.enable {
    stylix = {
      enable = true;
      enableReleaseChecks = false; # Remove warning message
      targets = {
        chromium.enable = false;
        console.enable = false;
        plymouth.enable = false;
      };
      polarity = "dark";
      # CHANGE THIS FOR DEFAULT WALLPAPER, ALONG WITH $HOME/Git/vicnotor/nixos/modules/home-manager/toggleable/hypr/hyprpaper.conf
      image = ./cats.jpg;
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
          package = pkgs.noto-fonts-color-emoji;
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
        terminal = 1.0;
        desktop = 1.0;
        popups = 1.0;
      };
    };
  };
}
