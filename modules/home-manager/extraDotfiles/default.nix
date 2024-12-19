{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    extraDotfiles.enable =
      lib.mkEnableOption "enables importing of all temporary dotfiles";
  };

  config = lib.mkIf config.extraDotfiles.enable {
    home.file = {
      ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/xxheyhey/nixos-xx/extraDotfiles/nvim;
    };
  };
}
