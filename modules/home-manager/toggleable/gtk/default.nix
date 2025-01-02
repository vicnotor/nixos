{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    gtkModule.enable =
      lib.mkEnableOption "enables gtk config module";
  };

  config = lib.mkIf config.gtkModule.enable {
    gtk = {
      enable = true;

      theme = {
        package = pkgs.rose-pine-gtk-theme;
        name = "rose-pine";
      };

      # iconTheme = {
      #   package = pkgs.papirus-icon-theme;
      #   name = "Papirus";
      # };

      font = {
        name = "Ubuntu Nerd Font";
        size = 11;
      };
    };
  };
}
