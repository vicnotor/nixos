{
  lib,
  config,
  ...
}: {
  options = {
    virtualisation-guestModule.enable =
      lib.mkEnableOption "virtualisation guest module";
  };

  config = lib.mkIf config.virtualisation-guestModule.enable {
    services.qemuGuest.enable = true;
    services.spice-vdagentd.enable = true;
  };
}
