{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    mpvModule.enable =
      lib.mkEnableOption "enables mpv module";
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
        hwdev = "auto-safe";
        priority = "high"; # Makes PC prioritize MPV for allocating resources.

        # General
        no-hidpi-window-scale = true; # This Disables High DPI scaling
        target-colorspace-hint = true;

        # Audio
        audio-pitch-correction = "yes"; # automatically insert scaletempo when playing with higher speed
        volume = 100; # Set volume to 100% on startup.
        volume-max = 200; # Set player max vol to 200%.

        # Subtitles
        subs-with-matching-audio = "no"; # Won't ignore subtitles tagged as "Forced"
        sub-fix-timing = "yes";
        sub-scale = "0.5";
        sub-auto = "fuzzy";
        sub-gray = "yes"; # Monochrome subs makes yellow font grey
        sub-font = "Trebuchet MS";
        sub-bold = "yes"; # Set the font to bold.
        #sub-font-size = 55 # Set default subtitle size if not specified.
      };
    };
  };
}
