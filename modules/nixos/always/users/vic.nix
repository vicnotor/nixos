{
  lib,
  config,
  ...
}: {
  options = {
    vic.enable =
      lib.mkEnableOption "vic user module";
  };

  config = lib.mkIf config.vic.enable {
    users = {
      users.vic = {
        isNormalUser = true;
        home = "/home/vic";
        extraGroups = ["wheel"]; # wheel ‘sudo’ for the user
        initialPassword = "password";
      };
    };
  };
}
