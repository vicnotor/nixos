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
    users.users.vic.extraGroups = ["audio" "pipewire"];
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      audio.enable = true;
      systemWide = true; # Might remove later, but now fixes audio not working bug that started on 14-7-2025
      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };
}
