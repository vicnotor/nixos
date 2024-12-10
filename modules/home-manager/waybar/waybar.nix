{ pkgs, lib, config, ... }: {

  options = {
    waybar.enable = 
      lib.mkEnableOption "enables hyprland module";
  };

  config = lib.mkIf config.waybar.enable {
    programs.waybar = {
      enable = true;
      style = builtins.readFile ~/Git/xxheyhey/nixos-xx/modules/home-manager/waybar/style.css;

      settings = [{
        layer = "top";
        margin = 0;
        height = 24;
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
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
          format = "";
          on-scroll-up = "busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateTemperature n +100";
          on-scroll-down = "busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateTemperature n -100";
          on-click-middle = "busctl --user set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 6500";
        };
        tray = {
          icon-size = 18;
          spacing = 6;
          reverse-direction = true;
        };
        backlight = {
          format = "{icon}  {percent}%";
          format-icons = [ "󰃞" "󰃠" ];
        };
        clock = {
          interval = 1;
          format = "{:%Y-%m-%d %H:%M:%S}";
          tooltip-format = "<tt><big>{calendar}</big></tt>";
        };
        cpu = {
          format = "C {usage}%";
          tooltip = false;
        };
        memory = {
          format = "󰍛  {}%";
          on-click = "alacritty -e htop";
        };
        temperature = {
          critical-threshold = 80;
          format = "{icon}  {temperatureC}°C";
          format-icons = [ "" ];
        };
        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon}  {capacity}%";
          format-full = "  {capacity}%";
          format-charging = "  {capacity}%";
          format-plugged = "  {capacity}%";
          format-alt = "{icon}  {time}";
          format-icons = [ "" "" "" "" "" ];
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
            default = [ "" "" "" ];
          };
          on-click = "pavucontrol";
        };
      }];
    };
  }
