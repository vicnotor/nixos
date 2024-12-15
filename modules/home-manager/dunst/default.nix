{ pkgs, lib, config, ... }: {

  options = {
    dunst.enable = 
      lib.mkEnableOption "enables zsh module";
  };

  config = lib.mkIf config.dunst.enable {
    services.dunst = {
      enable = true;
      iconTheme = {
        name = "Papirus";
        package = pkgs.papirus-icon-theme;
        size = "32x32";
      };
      settings = {
        global = {
          width = 300;
          height = 300;
          offset = "30x50";
          origin = "top-right";
          transparency = 10;
          font = "Ubuntu Nerd Font";
        };

        urgency_low = {
          background = "#24273a";
          foreground = "#f4dbd6";
          frame_color = "#24273a";
        };
        urgency_normal = {
          background = "#24273a";
          foreground = "#f4dbd6";
          frame_color = "#24273a";
        };
        urgency_critical = {
          background = "#24273a";
          foreground = "#ed8796";
          frame_color = "#24273a";
        };
      };
    };
  };
}
