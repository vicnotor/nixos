{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [./quickemu];
  options = {
    virtualizationModule.enable =
      lib.mkEnableOption "enables virtualization module";
  };

  config = lib.mkIf config.virtualizationModule.enable {
    quickemuModule.enable = true; # See ./quickemu/default.nix

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
