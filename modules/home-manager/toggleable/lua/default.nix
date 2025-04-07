{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    luaModule.enable =
      lib.mkEnableOption "Lua module";
  };

  config = lib.mkIf config.luaModule.enable {
    home.packages = with pkgs;
      [
        lua-language-server
      ];
  };
}
