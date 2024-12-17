{ pkgs, lib, config, ... }: {

  options = {
    alacritty.enable = 
      lib.mkEnableOption "enables alacritty module";
  };

  config = lib.mkIf config.alacritty.enable {
    window = {
      opacity = 1;
      dimensions = {
        columns = 110;
        lines = 40;
      };
    };
    colors = {
      primary = {
        background = "#1E1D23";
        foreground = "#F0F0F0";
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
        chars = "\u2717";
        key = "Return";
        mods = "Control";
      }
      {
        chars = "\u2713";
        key = "Return";
        mods = "Control|Shift";
      }
      {
        chars = "\u25C6";
        key = "I";
        mods = "Control";
      }
      {
        chars = "\u25B6";
        key = "M";
        mods = "Control";
      }
      {
        chars = "\u2605";
        key = ",";
        mods = "Control";
      }
      {
        chars = "\u25CF";
        key = "H";
        mods = "Control|Shift";
      }
    ];
  };
}
