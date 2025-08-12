{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    alacrittyModule.enable =
      lib.mkEnableOption "Alacritty module";
  };

  config = lib.mkIf config.alacrittyModule.enable {
    home.packages = [pkgs.alacritty-graphics];
    home.file = {
      ".config/alacritty/alacritty.toml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Git/vicnotor/nixos/modules/home-manager/toggleable/alacritty/alacritty.toml";
    };
  };
}
