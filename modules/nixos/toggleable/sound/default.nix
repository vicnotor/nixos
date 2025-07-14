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
      enable = false; # Pipewire is currently broken (14-7-2025) so using pulseaudio for the time being
      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };

    # Remove everything below if pipewire is fixed for me
    services.pulseaudio = {
      enable = true;
      support32Bit = true;
    };
    users.users.vic.extraGroups = ["audio"];
  };
}
