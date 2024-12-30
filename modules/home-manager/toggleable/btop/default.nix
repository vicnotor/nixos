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
        # Theme
        color_theme = "tokyo-night";
        theme_background = false;

        # Looks
        show_battery = true;
        show_disks = false;
        shown_boxes = "cpu mem proc";
        presets = "cpu:0:default,mem:0:default,proc:0:default";
        proc_sorting = "memory";

        # Other
        vim_keys = true;
      };
    };
  };
}
