{
  "Web" = {
    profile-cond = "string.match(p.filename, \"HorribleSubs\")~=nil or string.match(p.filename, \"Erai%-raws\")~=nil or string.match(p.filename, \"SubsPlease\")~=nil";
    profile-restore = "copy-equal";
    deband = "yes";
  };
  "Mini-Encode #1" = {
    profile-cond = "string.match(p.filename, \"ASW\")~=nil or string.match(p.filename, \"DKB\")~=nil or string.match(p.filename, \"Judas\")~=nil";
    profile-restore = "copy-equal";
    deband = "yes";
  };
  "Mini-Encode #2" = {
    profile-cond = "string.match(p.filename, \"Cerberus\")~=nil or string.match(p.filename, \"Nep%_Blanc\")~=nil or string.match(p.filename, \"Reaktor\")~=nil";
    profile-restore = "copy-equal";
    deband = "yes";
  };
  "Mini-Encode #3" = {
    profile-cond = "string.match(p.filename, \"Cleo\")~=nil or string.match(p.filename, \"Akihito\")~=nil or string.match(p.filename, \"Reaktor\")~=nil";
    profile-restore = "copy-equal";
    deband = "yes";
  };
  "Mini-Encode #4" = {
    profile-cond = "string.match(p.filename, \"Ember\")~=nil";
    profile-restore = "copy-equal";
    deband = "yes";
  };
  "Audio" = {
    profile-cond = "string.match(p.filename, \"%.mp3$\")~=nil or string.match(p.filename, \"%.ogg$\")~=nil or string.match(p.filename, \"%.wav$\")~=nil or string.match(p.filename, \"%.flac$\")~=nil or string.match(p.filename, \"%.aac$\")~=nil or string.match(p.filename, \"%.wma$\")~=nil or string.match(p.filename, \"%.m4a$\")~=nil or string.match(p.filename, \"%.opus$\")~=nil or string.match(p.filename, \"%.vorbis$\")~=nil or string.match(p.filename, \"%.alac$\")~=nil";
    fs = "no";
    geometry = "20%+100%+0%";
  };
  "Video" = {
    profile-cond = "get(\"current-tracks/video/albumart\") == false";
    profile-restore = "copy-equal";
    save-position-on-quit = true;
    watch-later-options-add = "video-zoom";
  };
  "autoloop" = {
    profile-cond = "duration <= 60";
    profile-restore = "copy-equal";
    loop-file = "inf";
  };
  "protocol.http" = {
    hls-bitrate = "max";
    force-seekable = "yes";
    cache = "yes";
    no-cache-pause = true;
  };
  "protocol.https" = {
    profile = "protocol.http";
  };
  "Dolby Vision" = {
    target-trc = "pq";
    target-prim = "bt.2020";
  };
  "Snapcast" = {
    audio-channels = "stereo";
    audio-samplerate = 48000;
    audio-format = "s16";
    ao = "pcm";
    ao-pcm-file = "/tmp/snapfifo";
  };
}
