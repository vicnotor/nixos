{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  options = {
    waybarModule.enable =
      lib.mkEnableOption "enables waybar module";
  };

  config = lib.mkIf config.waybarModule.enable {
    programs.waybar = {
      enable = true;
      package = (
        inputs.waybar.packages.${pkgs.stdenv.hostPlatform.system}.waybar.overrideAttrs
        (oldAttrs: {
          mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
        })
      );
      style = builtins.readFile ./style.css;

      settings = [
        {
          layer = "top";
          margin = "0px";
          height = 24;
          modules-left = ["hyprland/workspaces"];
          modules-center = ["hyprland/window"];
          modules-right = [
            "tray"
            "pulseaudio"
            "backlight"
            "custom/wl-gammarelay"
            "memory"
            "battery"
            "clock"
          ];
          "hyprland/workspaces" = {
            format = "{icon}";
            on-click = "activate";
            sort-by-number = true;
          };
          "hyprland/window" = {
            format = "{}";
            max-length = 50;
            separate-outputs = true;
            hide-empty-text = true;
          };
          "custom/wl-gammarelay" = {
            format = " ";
            exec = "wl-gammarelay-rs watch {t}";
            on-scroll-up = "busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateTemperature n +100";
            on-scroll-down = "busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateTemperature n -100";
            on-click-middle = "busctl --user set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 6500";
            tooltip = true;
            tooltip-format = " {}K";
          };
          tray = {
            icon-size = 18;
            spacing = 6;
            reverse-direction = true;
          };
          backlight = {
            format = "{icon} {percent}%";
            format-icons = ["󰃞" "󰃠"];
            on-click-middle = "brightnessctl s 9600";
            tooltip = false;
          };
          clock = {
            interval = 1;
            format = "{:%d-%m  %H:%M:%S}";
            tooltip-format = "<tt><big>{calendar}</big></tt>";
          };
          cpu = {
            format = "C {usage}%";
            tooltip = false;
          };
          memory = {
            format = "󰍛 {}%";
            on-click = "alacritty -e htop";
          };
          temperature = {
            critical-threshold = 80;
            format = "{icon} {temperatureC}°C";
            format-icons = [""];
          };
          battery = {
            interval = 10;
            states = {
              warning = 25;
              critical = 15;
            };
            format = "{icon}  {capacity}%";
            format-full = " {capacity}%";
            format-charging = "󱐌 {capacity}%";
            format-plugged = " {capacity}%";
            format-icons = ["" "" "" "" ""];
          };
          pulseaudio = {
            format = "{icon}  {volume}%";
            format-muted = "";
            format-icons = {
              headphone = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = ["" "" ""];
            };
            on-click = "pavucontrol";
            on-click-middle = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          };
        }
      ];
    };
  };
}
