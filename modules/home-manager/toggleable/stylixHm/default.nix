{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    stylixHmModule.enable =
      lib.mkEnableOption "Stylix home-manager module";
  };

  config = lib.mkIf config.stylixHmModule.enable {
    stylix = {
      enableReleaseChecks = false; # Remove warning message
      targets = {
        dunst.enable = false;
        ghostty.enable = false;
        hyprland.enable = false;
        neovim.enable = false;
        rofi.enable = false;
        tmux.enable = false;
        waybar.enable = false;
        wezterm.enable = false;
      };
      iconTheme = {
        enable = true;
        package = pkgs.papirus-icon-theme;
        light = "Papirus";
        dark = "Papirus";
      };
    };
  };
}
