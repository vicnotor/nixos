{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    laptopModule.enable =
      lib.mkEnableOption "module with some laptop-specific settings";
  };

  config = lib.mkIf config.laptopModule.enable {
    powerManagement.enable = true;
    services.thermald.enable = true;
    programs.auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";
        };
        charger = {
          governor = "performance";
          turbo = "auto";
        };
      };
    };

    # batterylife check and notification
    systemd.user.timers."batterylife-check" = {
      wantedBy = ["timers.target"];
      timerConfig = {
        OnBootSec = "5m";
        OnUnitActiveSec = "5m";
        Unit = "batterylife-check.service";
      };
    };

    systemd.user.services."batterylife-check" = {
      script = ''
        export DISPLAY=:0 # Cannot autolaunch D-Bus without X11 $DISPLAY error fix
        # Set the threshold for low battery (percentage)
        threshold=20
        # Get the battery status
        battery_status=$(${pkgs.acpi}/bin/acpi -b | ${pkgs.gawk}/bin/awk -F'[,:%]' '{print $2}')
        # Get the battery percentage
        battery_percentage=$(${pkgs.acpi}/bin/acpi -b | ${pkgs.gawk}/bin/awk -F'[,:%]' '/Battery/ {gsub(/ /,"",$3); print $3}')
        # Check if the battery is below the threshold
        if [ "$battery_status" != " Charging" ] && [ "$battery_percentage" -le "$threshold" ]; then
            ${pkgs.dunst}/bin/dunstify -a "batteryCritical" -u critical -i battery -h string:x-dunst-stack-tag:"batteryCritical" -h int:value:"$battery_percentage" "Battery: ''${battery_percentage}%"
        fi
      '';
      serviceConfig = {
        Type = "oneshot";
      };
    };
  };
}
