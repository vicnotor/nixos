{
  lib,
  config,
  ...
}: {
  options = {
    keydModule.enable =
      lib.mkEnableOption "keyd module";
  };

  config = lib.mkIf config.keydModule.enable {
    # Makes sure that when you type the make palm rejection work with keyd
    # https://github.com/rvaiya/keyd/issues/723
    environment.etc."libinput/local-overrides.quirks".text = ''
      [Serial Keyboards]
      MatchUdevType=keyboard
      MatchName=keyd*keyboard
      AttrKeyboardIntegration=internal
    '';

    services.keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = ["*"];
          settings = {
            main = {
              capslock = "esc";
              esc = "capslock";
            };
          };
        };
      };
    };
  };
}
