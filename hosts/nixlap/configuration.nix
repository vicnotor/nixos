{config, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
  ];

  boot.extraModulePackages = [(config.boot.kernelPackages.callPackage ./acer-wmi-battery/default.nix {})];
  boot.kernelModules = ["acer-wmi-battery"];
  boot.extraModprobeConfig = ''
    options acer-wmi-battery enable_health_mode=1
  '';
}
