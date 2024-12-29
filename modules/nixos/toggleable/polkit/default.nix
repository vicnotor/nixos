{
  lib,
  config,
  ...
}: {
  options = {
    polkitModule.enable =
      lib.mkEnableOption "enables polkit module";
  };

  config = lib.mkIf config.polkitModule.enable {
    security.polkit = {
      enable = true;

      # Rules to give some permissions to normal users
      extraConfig = ''
        polkit.addRule(function(action, subject) {
          if (
            subject.isInGroup("users")
              && (
                # reboot and poweroff
                action.id == "org.freedesktop.login1.reboot" ||
                action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
                action.id == "org.freedesktop.login1.power-off" ||
                action.id == "org.freedesktop.login1.power-off-multiple-sessions" ||

                # mount
                action.id == "io.systemd.mount-file-system.mount-image" ||
                action.id == "io.systemd.mount-file-system.mount-image" ||
                action.id == "io.systemd.mount-file-system.mount-untrusted-image" ||
                action.id == "io.systemd.mount-file-system.mount-untrusted-image-privately" ||
                action.id == "org.freedesktop.udisks2.filesystem-mount" ||
                action.id == "org.freedesktop.udisks2.filesystem-mount-other-seat" ||
                action.id == "org.freedesktop.udisks2.filesystem-mount-other-user" ||
                action.id == "org.freedesktop.udisks2.filesystem-mount-system" ||
                action.id == "org.freedesktop.udisks2.filesystem-unmount-others"
              )
            )
          {
            return polkit.Result.YES;
          }
        });
      '';
    };
  };
}
