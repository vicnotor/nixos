{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.services.btrfsmaintenance;

  btrfsmaintenancePkg = pkgs.callPackage /path/to/btrfsmaintenance/default.nix {};
in {
  options.services.btrfsmaintenance = {
    enable = lib.mkEnableOption "btrfsmaintenance periodic maintenance scripts";

    timers = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = ["scrub" "balance" "defrag" "trim"];
      description = "List of btrfs maintenance timers to enable.";
    };

    package = lib.mkOption {
      type = lib.types.package;
      default = btrfsmaintenancePkg;
      description = "The btrfsmaintenance package to use.";
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.packages = [cfg.package];

    # Link sysconfig file into /etc
    environment.etc."sysconfig/btrfsmaintenance".source = "${cfg.package}/etc/sysconfig.btrfsmaintenance";

    # Enable the requested timers
    systemd.timers =
      lib.genAttrs (map (name: "btrfs-" + name) cfg.timers)
      (_: {enable = true;});
  };
}
