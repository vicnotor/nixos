{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    dunstModule.enable =
      lib.mkEnableOption "enables dunst module";
  };

  config = lib.mkIf config.dunstModule.enable {
    services.dunst = {
      enable = true;
      # iconTheme = {
      #   name = "Papirus";
      #   package = pkgs.papirus-icon-theme;
      #   size = "16x16";
      # };
      settings = {
        global = {
          origin = "top-right";
          transparency = 10;
          # font = "Ubuntu Nerd Font 11"; # Not needed because of Stylix
        };

        urgency_low = lib.mkForce {
          background = "#24273a";
          foreground = "#f4dbd6";
          frame_color = "#24273a";
        };
        urgency_normal = lib.mkForce {
          background = "#24273a";
          foreground = "#f4dbd6";
          frame_color = "#24273a";
        };
        urgency_critical = lib.mkForce {
          background = "#24273a";
          foreground = "#ed8796";
          frame_color = "#24273a";
        };
      };
    };
  };
}
