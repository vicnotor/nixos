{
  lib,
  config,
  ...
}: {
  options = {
    soundModule.enable =
      lib.mkEnableOption "enables sound settings module";
  };

  config = lib.mkIf config.soundModule.enable {
    services = {
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
      };
    };
  };
}
