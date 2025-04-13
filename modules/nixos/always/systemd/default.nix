{...}: {
  systemd.timers."cycle-wallpaper" = {
    wantedBy = ["timers.target"];
    timerConfig = {
      OnBootSec = "10m";
      OnUnitActiveSec = "10m";
      Unit = "cycle-wallpaper.service";
    };
  };

  systemd.services."hello-world" = {
    script = ''
      wpcycle
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "vic";
    };
  };
}
