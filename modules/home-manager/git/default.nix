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
      userName = "xxheyhey";
      userEmail = "95343562+xxheyhey@users.noreply.github.com";
      extraConfig = {
        core = {editor = "nvim";};
        init = {defaultBranch = "main";};
      };
    };
  };
}
