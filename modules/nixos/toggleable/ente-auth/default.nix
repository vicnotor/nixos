{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    ente-authModule.enable =
      lib.mkEnableOption "Ente-auth module";
  };

  config = lib.mkIf config.ente-authModule.enable {
    environment.systemPackages = [pkgs.ente-auth];
    services.gnome.gnome-keyring.enable = true;
  };
}
