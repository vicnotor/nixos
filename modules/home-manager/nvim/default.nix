{
  lib,
  config,
  ...
}: {
  options = {
    nvim.enable =
      lib.mkEnableOption "enables importing of nvim config";
  };

  config = lib.mkIf config.nvim.enable {
    home.file = {
      ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/xxheyhey/nixos-xx/extraDotfiles/nvim;
    };
  };
}
