{
  lib,
  config,
  ...
}: {
  options = {
    systemd-user-servicesModule.enable =
      lib.mkEnableOption "custom systemd user services";
  };

  config = lib.mkIf config.systemd-user-servicesModule.enable {
    systemd.user = {
      enable = true;
      services = {
        wprestart = {
          Unit = {
            Description = "Restart swww on resume";
            After = ["suspend.target" "hibernate.target" "sleep.target"];
          };
          Install = {
            WantedBy = ["suspend.target" "hibernate.target" "sleep.target"];
          };
          Service = {
            Type = "oneshot";
            ExecStart = "${config.home.homeDirectory}/Git/vicnotor/nixos/extraFiles/shellScripts/wprestart";
          };
        };
      };
    };
  };
}
