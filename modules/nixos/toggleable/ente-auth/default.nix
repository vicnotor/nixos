{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    bluetoothModule.enable =
      lib.mkEnableOption "bluetooth module";
  };

  config = lib.mkIf config.bluetoothModule.enable {
    environment.systemPackages = [pkgs.ente-auth];
    services.gnome.gnome-keyring.enable = true;
  };
}
