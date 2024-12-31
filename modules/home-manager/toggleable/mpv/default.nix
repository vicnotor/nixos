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
        autosub
        autosubsync-mpv
        uosc
      ]);
    programs.mpv = {
      enable = true;
      config = import ./config.nix;
      profiles = import ./profiles.nix;
      extraInput = builtins.readFile ./input.conf;
    };
  };
}
