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
    security.rtkit.enable = true;
    services.pipewire = {
      enable = false;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
    services.pulseaudio = {
      enable = true;
      support32Bit = true;
    };
    users.users.vic.extraGroups = ["audio"];
  };
}
