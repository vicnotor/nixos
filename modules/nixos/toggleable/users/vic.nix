{
  lib,
  config,
  ...
}: {
  options = {
    vicUserModule.enable =
      lib.mkEnableOption "enables vic user module";
  };

  config = lib.mkIf config.vicUserModule.enable {
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
