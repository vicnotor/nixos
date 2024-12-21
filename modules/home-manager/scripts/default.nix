{
  lib,
  config,
  ...
}: {
  options = {
    scripts.enable =
      lib.mkEnableOption "enables importing of all temporary dotfiles";
  };

  config = lib.mkIf config.scripts.enable {
    home = {
      file = {
        "bin".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/xxheyhey/nixos-xx/extraDotfiles/scripts;
      };
      sessionVariables = {
        EDITOR = "nvim";
        PATH="$HOME/bin:$PATH";
      };
    };
  };
}
