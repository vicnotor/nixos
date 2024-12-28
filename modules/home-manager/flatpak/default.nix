{
  lib,
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];
  options = {
    flatpakModule.enable =
      lib.mkEnableOption "enables nix-flatpak module";
  };

  config = lib.mkIf config.flatpakModule.enable {
    services.flatpak.update.auto.enable = false;
    services.flatpak.uninstallUnmanaged = false;
    services.flatpak.packages = [
      "com.usebottles.bottles"
    ];
  };
}
