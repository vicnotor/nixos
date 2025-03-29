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
          height = 27;
          modules-left = ["hyprland/workspaces"];
          modules-center = ["hyprland/window"];
          modules-right = [
            "tray"
            "pulseaudio#input"
            "pulseaudio#output"
            "backlight"
            "custom/wl-gammarelay"
            "memory"
            "temperature"
            "battery"
            "clock"
          ];
          "hyprland/workspaces" = {
            format = "{icon}";
            on-click = "activate";
            sort-by-number = true;
          };
          "hyprland/window" = {
            format = "";
            max-length = 50;
            separate-outputs = true;
            hide-empty-text = true;
          };
          "custom/wl-gammarelay" = {
            format = "  ";
            exec = "wl-gammarelay-rs watch {t}";
            on-scroll-up = "busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateTemperature n +100";
            on-scroll-down = "busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateTemperature n -100";
            on-click-right = "busctl --user set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 6500";
            on-click-middle = "busctl --user set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 6500";
            tooltip = true;
            tooltip-format = " {}K";
          };
          tray = {
            icon-size = 16;
            spacing = 6;
            reverse-direction = true;
          };
          backlight = {
            format = "{icon} {percent}%";
            format-icons = ["󰃞" "󰃟" "󰃠"];
            on-click-right = "brightnessctl s 50%";
            on-click-middle = "brightnessctl s 50%";
          };
          clock = {
            interval = 1;
            format = "{:%d-%m %H:%M:%S}";
            tooltip-format = "<tt><small>{calendar}</small></tt>";
            calendar = {
              "mode" = "month";
              "mode-mon-col" = 3;
              "weeks-pos" = "right";
              "on-scroll" = 1;
              "format" = {
                "months" = "<span color='#ffead3'><b>{}</b></span>";
                "days" = "<span color='#ecc6d9'><b>{}</b></span>";
                "weeks" = "<span color='#99ffdd'><b>W{}</b></span>";
                "weekdays" = "<span color='#ffcc66'><b>{}</b></span>";
                "today" = "<span color='#ff6699'><b><u>{}</u></b></span>";
              };
            };
          };
          cpu = {
            format = "C {usage}%";
            tooltip = false;
          };
          memory = {
            format = "󰍛 {}%";
            on-click = "taskmanager";
          };
          temperature = {
            thermal-zone = 5;
            critical-threshold = 80;
            format = "{icon} {temperatureC}°C";
            format-icons = ["" "" ""];
            on-click = "taskmanager";
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
          "pulseaudio#output" = {
            format = "{icon} {volume}%";
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
            on-click-right = "wpctl set-mute @DEFAULT_SINK@ toggle";
            on-click-middle = "wpctl set-mute @DEFAULT_SINK@ toggle";
          };
          "pulseaudio#input" = {
            format-source = "󰍬 {volume}%";
            format-source-muted = "󰍭";
            format = "{format_source}";
            on-click = "pavucontrol";
            on-click-right = "wpctl set-mute @DEFAULT_SOURCE@ toggle";
            on-click-middle = "wpctl set-mute @DEFAULT_SOURCE@ toggle";
            on-scroll-up = "wpctl set-volume @DEFAULT_SOURCE@ 1%+";
            on-scroll-down = "wpctl set-volume @DEFAULT_SOURCE@ 1%-";
            tooltip-format = "{desc}";
          };
        }
      ];
    };
  };
}
