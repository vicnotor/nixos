{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    steamModule.enable =
      lib.mkEnableOption "Steam module";
  };

  config = lib.mkIf config.steamModule.enable {
    programs = {
      steam = {
        enable = true;
        gamescopeSession.enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
      };
      gamescope.enable = true;
      gamemode = {
        enable = true;
        settings = {
          custom = {
            start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
            end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
          };
        };
      };
    };

    users.users.vic.extraGroups = ["gamemode"];

    # proton GE. NOTE: do not forget to run `protonup` to actually install proton
    environment = {
      systemPackages = with pkgs; [
        protonup
      ];
      sessionVariables = {
        STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
      };
    };
  };
}
