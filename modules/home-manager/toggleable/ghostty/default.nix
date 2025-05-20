{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: let
  ghosttyPatched = inputs.ghostty.packages.${pkgs.system}.default.overrideAttrs (old: {
    patches = (old.patches or []) ++ [./ghostty-capsescape.patch];
  });
in {
  options = {
    ghosttyModule.enable =
      lib.mkEnableOption "Ghostty module";
  };

  config = lib.mkIf config.ghosttyModule.enable {
    programs.ghostty = {
      enable = true;
      package = ghosttyPatched;
      enableZshIntegration = true;
      settings = {
        # Font
        font-size = 12;
        # The next three lines disable all ligatures
        font-feature = [
          "-calt"
          "-liga"
          "-dlig"
        ];
        bold-is-bright = true; # Bold text will use the bright color palette

        # Theme
        theme = "tokyonight";
        # background = #1E1D23 # My old Alacritty background
        # foreground = "#F9F0F0";
        selection-background = "#3b3e40";
        selection-foreground = "#f06090";

        # Cursor
        cursor-style = "block";
        cursor-style-blink = false;
        shell-integration-features = "no-cursor";

        # Window
        window-padding-balance = true;
        window-decoration = false;
        window-width = 110;
        window-height = 25;

        # Keybinds
        keybind = [
          "ctrl+backspace=ignore"
          "shift+enter=ignore"
          "ctrl+enter=text:✗"
          "ctrl+shift+enter=text:✓"
          "ctrl+shift+enter=text:✓"
          "ctrl+i=text:◆"
          "ctrl+m=text:▶"
          "ctrl+comma=text:★"
          "ctrl+shift+h=text:●"
          "ctrl+shift+h=text:●"
        ];

        # Other
        clipboard-trim-trailing-spaces = true;
        confirm-close-surface = false;
        # This makes every startup after the first one faster
        gtk-single-instance = true;
      };
    };
  };
}
