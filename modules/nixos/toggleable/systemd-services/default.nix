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
    systemd = {
      services = {
        wprestart = {
          description = "Restart swww after resume";
          wantedBy = ["sleep.target"];
          after = ["sleep.target"];
          serviceConfig = {
            Type = "oneshot";
            ExecStart = [
              "/run/current-system/sw/bin/su"
              "vic"
              "-c"
              "/home/vic/Git/vicnotor/nixos/extraFiles/shellScripts/wprestart"
            ];
          };
        };
      };
    };
  };
}
