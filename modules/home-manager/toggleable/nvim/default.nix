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
      packages = with pkgs; [
        yarn
        nodejs
        lua5_1
        lua-language-server
        luajitPackages.luarocks
        ripgrep
        gcc
      ];
      file = {
        ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Git/vicnotor/nixos/extraFiles/nvim";
      };
    };
  };
}
