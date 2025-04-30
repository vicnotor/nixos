{
  lib,
  config,
  ...
}: {
  options = {
    soundModule.enable =
      lib.mkEnableOption "sound settings module";
  };

  config = lib.mkIf config.soundModule.enable {
    services = {
      pipewire = {
        enable = true;
        alsa = {
          enable = true;
          support32Bit = true;
        };
        jack.enable = true;
        pulse.enable = true;
        wireplumber.enable = true;
      };
    };
  };
}
