{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nvimModule.enable =
      lib.mkEnableOption "Neovim module";
  };

  config = lib.mkIf config.nvimModule.enable {
    home = {
      packages = with pkgs; [
        gcc
        lua5_1
        lua-language-server
        luajitPackages.luarocks
        nodejs
        ripgrep
        tree-sitter
        yarn
      ];
      file = {
        ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Git/vicnotor/nixos/modules/home-manager/toggleable/nvim";
      };
    };
  };
}
