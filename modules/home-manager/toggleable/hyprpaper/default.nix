{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  options = {
    hyprpaperModule.enable =
      lib.mkEnableOption "hyprpaper module";
  };

  config = lib.mkIf config.hyprpaperModule.enable {
    systemd.packages = [inputs.hyprpaper.packages.${pkgs.system}.default];
    systemd.user.services.hyprpaper.wantedBy = ["default.target"];
    # programs.hyprpaper = {
    #   enable = true;
    #   package = inputs.hyprpaper.packages.${pkgs.system}.default;
    #   settings = {
    #     ipc = false;
    #   };
    # };
  };
}
