{
  lib,
  config,
  ...
}: {
  options = {
    gitModule.enable =
      lib.mkEnableOption "enables git module";
  };

  config = lib.mkIf config.gitModule.enable {
    programs.git = {
      enable = true;
      userName = "vicnotor";
      userEmail = "95343562+vicnotor@users.noreply.github.com";
      extraConfig = {
        core = {editor = "nvim";};
        init = {defaultBranch = "main";};
      };
    };
  };
}
