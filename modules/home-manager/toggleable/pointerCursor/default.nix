{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pointerCursorModule.enable =
      lib.mkEnableOption "pointerCursor module";
  };

  config = lib.mkIf config.pointerCursorModule.enable {
    home = {
      pointerCursor = {
        gtk.enable = true;
        # x11.enable = true;
        package = pkgs.rose-pine-cursor;
        name = "BreezeX-RosePine-Linux";
        size = 20;
      };
    };
  };
}
