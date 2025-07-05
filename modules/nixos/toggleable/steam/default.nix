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
      };
      gamemode.enable = true;
    };

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
