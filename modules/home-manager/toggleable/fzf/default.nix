{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    fzfModule.enable =
      lib.mkEnableOption "enables fzf module";
  };

  config = lib.mkIf config.fzfModule.enable {
    home.packages = [pkgs.fzf];

    programs.fzf = {
      enable = true;
      defaultOptions = [
        "--layout=reverse"
        "--border"
      ];
    };
  };
}
