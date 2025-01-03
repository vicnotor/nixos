{
  lib,
  config,
  pkgs,
  ...
}: let
  colors = config.lib.stylix.colors;
in {
  options = {
    stylixHmModule.enable =
      lib.mkEnableOption "enables Stylix home-manager module";
  };

  config = lib.mkIf config.stylixHmModule.enable {
    stylix = {
      targets = {
        ghostty.enable = false;
        hyprland.enable = false;
        neovim.enable = false;
        tmux.enable = false;
      };
      iconTheme = {
        enable = true;
        package = pkgs.papirus-icon-theme;
        light = "Papirus";
        dark = "Papirus";
      };
    };
    wayland.windowManager.hyprland = {
      settings = {
        general = {
          "col.active_border" = lib.mkForce "rgba(${config.lib.stylix.colors.base0D}ee) rgba(${colors.base08}ee) 135deg";
        };
      };
    };
    services.dunst = {
      settings = {
        urgency_low = lib.mkForce {
          background = "${colors.base02}";
          foreground = "${colors.base07}";
          frame_color = "${colors.base02}";
        };
        urgency_normal = lib.mkForce {
          background = "${colors.base02}";
          foreground = "${colors.base07}";
          frame_color = "${colors.base02}";
        };
        urgency_critical = lib.mkForce {
          background = "${colors.base02}";
          foreground = "${colors.base08}";
          frame_color = "${colors.base02}";
        };
      };
    };
  };
}
