{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    alacrittyModule.enable =
      lib.mkEnableOption "enables alacritty module";
  };

  config = lib.mkIf config.alacrittyModule.enable {
    home.packages = [
      pkgs.alacritty
    ];

    programs.alacritty = {
      enable = true;
      settings = {
        window = {
          opacity = 1;
          dimensions = {
            columns = 110;
            lines = 40;
          };
        };
        font = {
          size = 15;
          normal = {
            family = "UbuntuMono Nerd Font";
            style = "Regular";
          };
          bold = {
            family = "UbuntuMono Nerd Font";
            style = "Bold";
          };
          italic = {
            family = "UbuntuMono Nerd Font";
            style = "Italic";
          };
        };
        colors = {
          cursor = {
            cursor = "#FFFFFF";
            text = "#000000";
          };
          primary = {
            background = "#1E1D23";
            foreground = "#F9F0F0";
          };
          normal = {
            black = "#1a1a1a";
            blue = "#9d65ff";
            cyan = "#58d1eb";
            green = "#98e024";
            magenta = "#f4008f";
            red = "#f4005f";
            white = "#c4c5b5";
            yellow = "#fa8419";
          };
          bright = {
            black = "#9e9778";
            blue = "#9d65ff";
            cyan = "#58d1eb";
            green = "#98e024";
            magenta = "#f4008f";
            red = "#f4005f";
            white = "#f6f6ef";
            yellow = "#e0d561";
          };
        };
        keyboard.bindings = [
          {
            key = "Backspace";
            mods = "Control";
            action = "None";
          }
          {
            key = "[";
            mods = "Control";
            action = "ToggleViMode";
          }
          {
            chars = "✗";
            key = "Return";
            mods = "Control";
          }
          {
            chars = "✓";
            key = "Return";
            mods = "Control|Shift";
          }
          {
            chars = "◆";
            key = "I";
            mods = "Control";
          }
          {
            chars = "▶";
            key = "M";
            mods = "Control";
          }
          {
            chars = "★";
            key = ",";
            mods = "Control";
          }
          {
            chars = "●";
            key = "H";
            mods = "Control|Shift";
          }
        ];
      };
    };
  };
}
