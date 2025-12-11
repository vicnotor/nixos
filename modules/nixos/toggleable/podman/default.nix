{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    podmanModule.enable =
      lib.mkEnableOption "Podman module";
  };

  config = lib.mkIf config.podmanModule.enable {
    users.users.vic.extraGroups = ["podman"];

    virtualisation = {
      containers.enable = true;
      podman = {
        enable = true;
        defaultNetwork.settings.dns_enabled = true; # Required for containers under podman-compose to be able to talk to each other.
      };
    };

    environment.systemPackages = [
      pkgs.compose2nix
    ];
  };
}
