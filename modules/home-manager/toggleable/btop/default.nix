{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    btopModule.enable =
      lib.mkEnableOption "enables btop module";
  };

  config = lib.mkIf config.btopModule.enable {
    home.packages = [pkgs.alacritty];

    programs.btop = {
      enable = true;
      settings = {
        color_theme = "tokyo-night";
        theme_background = false;
        show_battery = true;
        shown_boxes = "proc cpu mem gpu0 gpu1";
      };
    };
  };
}
