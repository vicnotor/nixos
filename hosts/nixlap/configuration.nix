{config, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
  ];

  networking.hostName = "nixlap";
  system.stateVersion = "24.11"; # DO NOT CHANGE!!!!!!!!!!! See https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion

  boot.extraModulePackages = [(config.boot.kernelPackages.callPackage ./acer-wmi-battery/default.nix {})];
  boot.kernelModules = ["acer-wmi-battery"];
  boot.extraModprobeConfig = ''
    options acer-wmi-battery enable_health_mode=1
  '';
}
