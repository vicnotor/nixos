{
  lib,
  config,
  pkgs,
  inputs,
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
      inputs.compose2nix.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
