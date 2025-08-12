{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    fastfetchModule.enable =
      lib.mkEnableOption "Fastfetch module";
  };

  config = lib.mkIf config.fastfetchModule.enable {
    home.packages = [pkgs.fastfetch];
    home.file = {
      ".config/fastfetch/config.jsonc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Git/vicnotor/nixos/modules/home-manager/toggleable/fastfetch/config.jsonc";
    };
  };
}
