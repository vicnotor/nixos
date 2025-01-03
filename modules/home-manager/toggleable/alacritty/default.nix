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
    home.packages = [pkgs.alacritty];

    programs.alacritty = {
      enable = true;
      settings = {
        window = {
          dimensions = {
            columns = 110;
            lines = 25;
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
