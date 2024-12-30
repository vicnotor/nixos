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
        vim_keys = true;
        show_battery = true;
        shown_boxes = "cpu mem proc gpu0 gpu1";
        presets = "cpu:0:default,mem:0:default,proc:0:default,gpu0:0:default,gpu1:0:default";
      };
    };
  };
}
