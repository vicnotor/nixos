{
  lib,
  config,
  ...
}: {
  options = {
    systemd-servicesModule.enable =
      lib.mkEnableOption "custom systemd global services module";
  };

  config = lib.mkIf config.systemd-servicesModule.enable {
    systemd.user.services.wprestart = {
      Unit = {
        Description = "Restart swww on resume";
        PartOf = ["graphical-session.target"];
      };
      Install = {
        WantedBy = ["graphical-session.target"];
      };
      Service = {
        Type = "oneshot";
        ExecStart = "${config.home.homeDirectory}/Git/vicnotor/nixos/extraFiles/shellScripts/wprestart";
      };
    };

    systemd.user.timers.resume-restart = {
      Unit = {
        Description = "Trigger swww restart shortly after resume";
      };
      Install = {
        WantedBy = ["timers.target"];
      };
      Timer = {
        OnActiveSec = "5s";
        AccuracySec = "1s";
        Persistent = false;
        Unit = "wprestart.service";
      };
    };
  };
}
