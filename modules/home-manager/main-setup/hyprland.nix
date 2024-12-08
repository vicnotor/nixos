{ pkgs, lib, config, ... }: {

  options = {
    hyprland.enable = 
      lib.mkEnableOption "enables hyprland module";
  };

  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland =
      {
        enable = true;
        xwayland.enable = true;
      };
  };
}
