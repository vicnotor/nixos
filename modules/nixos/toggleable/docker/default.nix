{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    dockerModule.enable =
      lib.mkEnableOption "Docker module";
  };

  config = lib.mkIf config.dockerModule.enable {
    users.users.vic.extraGroups = ["docker"];

    virtualisation = {
      containers.enable = true;
      docker = {
        enable = true;
        storageDriver = "btrfs";
      };
    };
    environment.systemPackages = [
      pkgs.compose2nix
    ];
  };
}
