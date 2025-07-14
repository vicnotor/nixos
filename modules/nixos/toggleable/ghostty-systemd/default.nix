{
  lib,
  config,
  ...
}: {
  options = {
    ghostty-systemdModule.enable =
      lib.mkEnableOption "ghostty systemd integration module";
  };

  config = lib.mkIf config.ghostty-systemdModule.enable {
    systemd.user.services."com.mitchellh.ghostty.service" = {
      enable = true;
    };
  };
}
