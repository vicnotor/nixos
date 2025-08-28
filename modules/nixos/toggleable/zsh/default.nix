{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    zshModule.enable =
      lib.mkEnableOption "zsh module";
  };

  config = lib.mkIf config.zshModule.enable {
    programs.zsh.enable = true;
    environment.pathsToLink = ["/share/zsh"];

    users = {
      defaultUserShell = pkgs.zsh;
    };
  };
}
