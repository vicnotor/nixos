{
  config,
  lib,
  pkgs,
  ...
}: {
  options.btrfsModule = {
    enable = lib.mkEnableOption "BTRFS maintenance and snapshot stuff";
  };

  config = lib.mkIf config.btrfsModule.enable {
    services.btrfs.autoScrub.enable = true;

    systemd.services = {
      "btrfs-balance" = {
        description = "Balance block groups on a btrfs filesystem";
        documentation = ["man:btrfs-balance"];
        after = ["fstrim.service" "btrfs-trim.service" "btrfs-scrub.service"];
        script = ''
          ${pkgs.btrfs-progs}/bin/btrfs balance start -dusage=0 /
          ${pkgs.btrfs-progs}/bin/btrfs balance start -v -dusage=5 /
          ${pkgs.btrfs-progs}/bin/btrfs balance start -musage=0 /
          ${pkgs.btrfs-progs}/bin/btrfs balance start -v -musage=5 /
        '';
        serviceConfig = {
          Type = "simple";
          IOSchedulingClass = "idle";
          CPUSchedulingPolicy = "idle";
        };
      };
    };

    systemd.timers = {
      "btrfs-balance" = {
        wantedBy = ["timers.target"];
        timerConfig = {
          OnCalendar = "weekly";
          Persistent = "true";
          Unit = "btrfs-balance.service";
        };
      };
    };

    services.snapper = {
      configs = {
        home = {
          SUBVOLUME = "/home";
          ALLOW_USERS = ["vic"];
          TIMELINE_CREATE = true;
          TIMELINE_CLEANUP = true;
        };
      };
    };
  };
}
