{
  lib,
  config,
  ...
}: {
  options = {
    virtualisationModule.enable =
      lib.mkEnableOption "enables virtualisation module";
  };

  config = lib.mkIf config.virtualisationModule.enable {
    users.groups.libvirtd.members = ["vic"];
    virtualisation = {
      libvirtd.enable = true;
      spiceUSBRedirection.enable = true;
    };
  };
}
