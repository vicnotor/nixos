{
  lib,
  config,
  ...
}: {
  options = {
    gitModule.enable =
      lib.mkEnableOption "git module";
  };

  config = lib.mkIf config.gitModule.enable {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "vicnotor";
          email = "victenbokum@gmail.com";
        };
        core = {editor = "nvim";};
        init = {defaultBranch = "main";};
      };
    };
  };
}
