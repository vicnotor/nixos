{
  lib,
  config,
  ...
}: {
  imports = [./flatpak.nix];

  options = {
    flatpakModule.enable =
      lib.mkEnableOption "Flatpak module";
  };

  config = lib.mkIf config.flatpakModule.enable {
    services.flatpak.enable = true;
  };
}
