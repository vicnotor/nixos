{
  lib,
  config,
  ...
}: {
  imports = [./quickemu];
  options = {
    virtualisationModule.enable =
      lib.mkEnableOption "virtualisation module";
  };

  config = lib.mkIf config.virtualisationModule.enable {
    quickemuModule.enable = false; # See ./quickemu/default.nix

    programs = {
      dconf.enable = true;
      virt-manager.enable = true;
    };

    users.groups.libvirtd.members = ["vic"];
    users.users.vic.extraGroups = ["libvirtd" "docker"];

    virtualisation = {
      containers.enable = true;
      libvirtd.enable = true;
      docker.enable = true;
      spiceUSBRedirection.enable = true;
    };
  };
}
