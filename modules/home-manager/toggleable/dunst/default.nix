{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    dunstModule.enable =
      lib.mkEnableOption "dunst module";
  };

  config = lib.mkIf config.dunstModule.enable {
    services.dunst = {
      enable = true;
      iconTheme = {
        name = "Papirus";
        package = pkgs.papirus-icon-theme;
        size = "16x16";
      };
      settings = {
        global = {
          origin = "top-right";
          transparency = 10;
          timeout = 3;
          font = "UbuntuSans Nerd Font 11";
        };

        urgency_low = {
          background = "#0F0F0Ffd";
          foreground = "#E5E1E9";
          frame_color = "#0F0F0F";
        };
        urgency_normal = {
          background = "#0F0F0Ffd";
          foreground = "#E5E1E9";
          frame_color = "#0F0F0F";
        };
        urgency_critical = {
          background = "#0F0F0Ffd";
          foreground = "#EA8DC1";
          frame_color = "#EA8DC1";
        };
      };
    };
  };
}
