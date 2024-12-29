{
  lib,
  config,
  ...
}: {
  options = {
    vic.enable =
      lib.mkEnableOption "enables vic user module";
  };

  config = lib.mkIf config.vic.enable {
    users = {
      users.vic = {
        isNormalUser = true;
        home = "/home/vic";
        extraGroups = ["wheel" "networkmanager"]; # wheel enables ‘sudo’ for the user
        initialPassword = "password";
      };
    };
  };
}
