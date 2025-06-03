{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    mpvModule.enable =
      lib.mkEnableOption "mpv module";
  };

  config = lib.mkIf config.mpvModule.enable {
    home.packages =
      [pkgs.mpv]
      ++ (with pkgs.mpvScripts; [
        autosubsync-mpv
        # uosc
      ]);
    programs.mpv = {
      enable = true;
      config = {
        ###Performance
        profile = "gpu-hq";
        vo = "gpu-next";
        gpu-api = "vulkan";
        gpu-context = "waylandvk";
        vulkan-async-compute = "yes";
        vulkan-async-transfer = "yes";
        vulkan-queue-count = 1;
        vd-lavc-dr = "yes";
        hwdec = "auto-safe";

        # General
        target-colorspace-hint = true;
        loop-file = "inf";

        # Audio
        audio-pitch-correction = "yes"; # automatically insert scaletempo when playing with higher speed
        volume = 100; # Set volume to 100% on startup.
        volume-max = 200; # Set player max vol to 200%.

        # Subtitles
        subs-with-matching-audio = "no"; # Won't ignore subtitles tagged as "Forced"
        sub-fix-timing = "yes";
        sub-font = lib.mkForce "Trebuchet MS";
        # sub-font-size = 30 # Set default subtitle size if not specified.
        # sub-scale = "1";
        sub-bold = "yes"; # Set the font to bold.
        sub-blur = 2.25;
        sub-border-color = "#000000";
        sub-border-size = 0.1;
        sub-shadow-offset = 0;
      };
    };
  };
}
