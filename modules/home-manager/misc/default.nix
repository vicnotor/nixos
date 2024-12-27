{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    misc.enable =
      lib.mkEnableOption "enables module with all miscellaneous home-manager stuff";
  };

  config = lib.mkIf config.misc.enable {
    # Session variables
    sessionVariables = {
      EDITOR = "nvim";
    };

    pointerCursor = {
      gtk.enable = true;
      # x11.enable = true;
      package = pkgs.rose-pine-cursor;
      name = "BreezeX-RosePine-Linux";
      size = 20;
    };
  };
}
