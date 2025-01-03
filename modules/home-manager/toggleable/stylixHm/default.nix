{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    stylixHmModule.enable =
      lib.mkEnableOption "enables Stylix home-manager module";
  };

  config = lib.mkIf config.stylixHmModule.enable {
    stylix = {
      targets = {
        ghostty.enable = false;
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
  };
}
