{
  lib,
  config,
  ...
}: {
  options = {
    nvimModule.enable =
      lib.mkEnableOption "enables importing of nvim config";
  };

  config = lib.mkIf config.nvimModule.enable {
    home.file = {
      ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/xxheyhey/nixos-xx/extraFiles/nvim;
    };
  };
}
