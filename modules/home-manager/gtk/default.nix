{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    gtk.enable =
      lib.mkEnableOption "enables gtk config module";
  };

  config = lib.mkIf config.gtk.enable {
    gtk = {
      enable = true;

      theme = {
        package = pkgs.rose-pine-gtk-theme;
        name = "rose-pine";
      };

      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus";
      };

      font = {
        name = "Ubuntu Nerd Font";
        size = 11;
      };
    };
  };
}
