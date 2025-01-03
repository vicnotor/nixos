{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  options = {
    ghosttyModule.enable =
      lib.mkEnableOption "enables Ghostty module";
  };

  config = lib.mkIf config.ghosttyModule.enable {
    home.packages = [
      inputs.ghostty.packages.${pkgs.system}.default
    ];
    programs.ghostty = {
      enable = true;
      package = inputs.ghostty.packages.${pkgs.system}.default;
      enableZshIntegration = true;
      settings = {
        # Font
        font-size = lib.mkForce 13;
        # The next three lines disable all ligatures
        font-feature = [
          "-calt"
          "-liga"
          "-dlig"
        ];

        # Theme
        theme = "tokyonight";
        # background = lib.mkForce #1E1D23 # My old Alacritty background
        foreground = lib.mkForce "#F9F0F0";
        selection-background = lib.mkForce "#3b3e40";
        selection-foreground = lib.mkForce "#f06090";

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
          "ctrl+backspace=unbind"
          "shift+enter=unbind"
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
