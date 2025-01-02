{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    stylixModule.enable =
      lib.mkEnableOption "enables Stylix module";
  };

  config = lib.mkIf config.stylixModule.enable {
    # environment.systemPackages = [pkgs.base16-schemes];
    stylix = {
      enable = true;
      image = ./dune_2_top_down.jpeg;
      polarity = "dark";
      base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
      targets = {
        chromium.enable = false;
      };
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
          package = pkgs.nerd-fonts.ubuntu-mono;
          name = "UbuntuMono Nerd Font";
        };

        emoji = {
          package = pkgs.noto-fonts-emoji;
          name = "Noto Color Emoji";
        };
        sizes = {
          applications = 11;
          terminal = 15;
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
