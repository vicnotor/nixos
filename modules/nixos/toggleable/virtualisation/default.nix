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
    users.users.vic.extraGroups = ["libvirtd" "docker" "podman"];

    virtualisation = {
      libvirtd.enable = true;
      spiceUSBRedirection.enable = true;
      containers.enable = true;
      docker.enable = true;
      podman = {
        enable = true;
        dockerCompat = true;
        defaultNetwork.settings.dns_enabled = true; # Required for containers under podman-compose to be able to talk to each other.
      };
    };
  };
}
