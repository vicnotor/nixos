{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [./quickemu];
  options = {
    virtualisationModule.enable =
      lib.mkEnableOption "enables virtualisation module";
  };

  config = lib.mkIf config.virtualisationModule.enable {
    # quickemuModule.enable = true; # See ./quickemu/default.nix

    programs.dconf.enable = true;

    users.groups.libvirtd.members = ["vic"];
    users.users.vic.extraGroups = ["libvirtd" "docker"];

    # environment.systemPackages = with pkgs; [
    #   virt-manager
    #   virt-viewer
    #   spice
    #   spice-gtk
    #   spice-protocol
    #   win-virtio
    #   win-spice
    # ];

    virtualisation = {
      containers.enable = true;
      # libvirtd = {
      #   enable = true;
      #   qemu = {
      #     swtpm.enable = true;
      #     ovmf.enable = true;
      #     ovmf.packages = [pkgs.OVMFFull.fd];
      #   };
      # };
      docker.enable = true;
      # spiceUSBRedirection.enable = true;
    };
    # services.spice-vdagentd.enable = true;
  };
}
