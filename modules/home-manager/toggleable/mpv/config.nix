{
  ###General
  profile = "gpu-hq";
  vo = "gpu";
  gpu-api = "vulkan";
  vulkan-async-compute = "yes";
  vulkan-async-transfer = "yes";
  vulkan-queue-count = 1;
  vd-lavc-dr = "yes";
  hwdec = "auto-copy";
  priority = "high"; # Makes PC prioritize MPV for allocating resources.
  cursor-autohide-fs-only = true;
  reset-on-next-file = "pause"; # Resumes playback when skip to next file
  volume = 100; # Set volume to 100% on startup.
  volume-max = 200; # Set player max vol to 200%.
  border = "no"; # uosc will draw its own window controls if you disable window border
  no-hidpi-window-scale = true; # This Disables High DPI scaling
  audio-pitch-correction = "yes"; # automatically insert scaletempo when playing with higher speed
  fs = "yes";
  snap-window = true;
  write-filename-in-watch-later-config = true;
  audio-channels = "stereo,5.1,7.1"; # Allow more than just one audio channel

  ###Interpolation (May increase CPU usage)
  interpolation = "yes";
  video-sync = "display-resample";
  tscale = "box";
  tscale-window = "quadric";
  tscale-clamp = "0.0";
  tscale-radius = "1.025";

  ###Subtitles
  alang = "jpn,jp,ja,eng,en";
  slang = "eng,en,enUS,enm,en-GB,en-US,bn,ben"; # enUS for Crunchyroll and enm for honorifics
  subs-with-matching-audio = "no"; # Won't ignore subtitles tagged as "Forced"
  sub-fix-timing = "yes";
  sub-scale = "0.5";
  sub-auto = "fuzzy";
  sub-gray = "yes"; # Monochrome subs makes yellow font grey
  sub-font = "Trebuchet MS";
  sub-bold = "yes"; # Set the font to bold.
  sub-file-paths = "**"; # This is for fuzzy-dir script to work
  #sub-font-size = 55 # Set default subtitle size if not specified.

  #Default demuxer is 150/75 MB, note that this uses RAM so set a reasonable amount.
  demuxer-mkv-subtitle-preroll = "yes";
  demuxer-max-bytes = 150000000; # 150MB, Max pre-load for network streams (1 MiB = 1048576 Bytes).
  demuxer-max-back-bytes = 75000000; # 75MB, Max loaded video kept after playback.
  stream-buffer-size = "5MiB";
  dither-depth = "auto";

  ###OSC / OSD
  osc = "no"; # required so that the 2 UIs don't fight each other
  osd-bar = "no"; # uosc provides its own seeking/volume indicators, so you also don't need this
  osd-font = "Inter Regular";
  osd-font-size = 30;
}
