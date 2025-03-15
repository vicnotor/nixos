{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nvimModule.enable =
      lib.mkEnableOption "enables importing of nvim config";
  };

  config = lib.mkIf config.nvimModule.enable {
    home = {
      packages = [
        pkgs.yarn # Needed for plugins
      ];
      file = {
        ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/vicnotor/nixos/extraFiles/nvim;
      };
    };
  };
}
