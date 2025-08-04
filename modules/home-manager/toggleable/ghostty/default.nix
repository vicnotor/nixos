{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  options = {
    ghosttyModule.enable =
      lib.mkEnableOption "Ghostty module";
  };

  config = lib.mkIf config.ghosttyModule.enable {
    programs.ghostty = {
      enable = true;
      package = inputs.ghostty.packages.${pkgs.system}.default.overrideAttrs (drv: {
        patches =
          drv.patches or []
          ++ [
            (pkgs.fetchpatch {
              url = "https://github.com/Opposite34/ghostty/commit/5b871c595254eece6bf44ab48f71409b7ed36088.patch";
              hash = "sha256-hCWp2MdoD89oYN3I+Pq/HW4k4RcozS1tDuXHO3Nd+Y8=";
            })
          ];
      });
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
        bold-color = "bright"; # Bold text will use the bright color palette

        # Theme
        theme = ./theme.txt;
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
        ];

        # Other
        clipboard-trim-trailing-spaces = true;
        confirm-close-surface = false;
        quit-after-last-window-closed = false;
      };
    };
  };
}
