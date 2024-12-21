# TODO: Change this to some other solution (like with home-manager or so)
{
  lib,
  config,
  ...
}: {
  options = {
    scripts.enable =
      lib.mkEnableOption "enables linking all custom scripts to .local/bin";
  };

  config = lib.mkIf config.scripts.enable {
    home = {
      file = {
        ".local/bin".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/xxheyhey/nixos-xx/extraDotfiles/scripts;
      };
      sessionVariables = {
        EDITOR = "nvim";
      };
    };
  };
}
