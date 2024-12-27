{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pointerCursorModule.enable =
      lib.mkEnableOption "enables pointerCursor module";
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
