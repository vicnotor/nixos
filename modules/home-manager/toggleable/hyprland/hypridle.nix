{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  options = {
    hypridleModule.enable =
      lib.mkEnableOption "enables hypridle module";
  };

  config = lib.mkIf config.hypridleModule.enable {
    services.hypridle = {
      enable = true;
      package = inputs.hypridle.packages.${pkgs.system}.default;
      settings = {
        listener = {
          timeout = 300; # seconds
          on-timeout = "hyprctl dispatch dpms off"; # turn screen off
          on-resume = "hyprctl dispatch dpms on"; # and back on
        };
      };
    };
  };
}
