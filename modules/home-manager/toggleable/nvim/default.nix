{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nvimModule.enable =
      lib.mkEnableOption "importing of nvim config";
  };

  config = lib.mkIf config.nvimModule.enable {
    home = {
      packages = [
        pkgs.yarn # Needed for plugins
      ];
      file = {
        ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Git/vicnotor/nixos/extraFiles/nvim";
      };
    };
  };
}
