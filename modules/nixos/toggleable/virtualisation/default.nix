{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    virtualisationModule.enable =
      lib.mkEnableOption "enables virtualisation module";
  };

  config = lib.mkIf config.virtualisationModule.enable {
    programs.dconf.enable = true;

    users.groups.libvirtd.members = ["vic"];
    users.users.vic.extraGroups = ["libvirtd"];

    environment.systemPackages = with pkgs; [
      virt-manager
      virt-viewer
      spice
      spice-gtk
      spice-protocol
      win-virtio
      win-spice
    ];

    virtualisation = {
      libvirtd = {
        enable = true;
        qemu = {
          swtpm.enable = true;
          ovmf.enable = true;
          ovmf.packages = [pkgs.OVMFFull.fd];
        };
      };
      spiceUSBRedirection.enable = true;
    };
    services.spice-vdagentd.enable = true;
  };
}
