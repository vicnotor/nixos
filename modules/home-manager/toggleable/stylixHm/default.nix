{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: let
  colors = config.lib.stylix.colors;
in {
  options = {
    stylixHmModule.enable =
      lib.mkEnableOption "Stylix home-manager module";
  };

  config = lib.mkIf config.stylixHmModule.enable {
    stylix = {
      targets = {
        # Manual theming can often be done in this file for the following programs
        ghostty.enable = false; # Change below
        hyprland.enable = false; # Change below
        neovim.enable = false;
        tmux.enable = false;
        waybar.enable = false;
      };
      iconTheme = {
        enable = true;
        package = pkgs.papirus-icon-theme;
        light = "Papirus";
        dark = "Papirus";
      };
    };
    programs.ghostty = {
      settings = {
        # Font
        font-size = lib.mkForce 13;
        theme = lib.mkForce "tokyonight";
        # background = lib.mkForce #1E1D23 # My old Alacritty background
        # foreground = lib.mkForce "#F9F0F0";
        selection-background = lib.mkForce "#3b3e40";
        selection-foreground = lib.mkForce "#f06090";
      };
    };
    wayland.windowManager.hyprland = {
      settings = {
        general = {
          "col.active_border" = lib.mkForce "rgba(${colors.base08}ee) rgba(${colors.base0D}ee) 45deg";
          "col.inactive_border" = lib.mkForce "rgba(${colors.base01}ee)";
        };
      };
    };
    services.dunst = {
      settings = {
        urgency_low = lib.mkForce {
          background = "#${colors.base01}ee";
          foreground = "#${colors.base07}";
          frame_color = "#${colors.base01}";
        };
        urgency_normal = lib.mkForce {
          background = "#${colors.base01}ee";
          foreground = "#${colors.base07}";
          frame_color = "#${colors.base01}";
        };
        urgency_critical = lib.mkForce {
          background = "#${colors.base01}ee";
          foreground = "#${colors.base08}";
          frame_color = "#${colors.base08}";
        };
      };
    };
  };
}
