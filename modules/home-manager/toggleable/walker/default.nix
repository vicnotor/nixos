{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  options = {
    walkerModule.enable =
      lib.mkEnableOption "Walker module";
  };

  config = lib.mkIf config.walkerModule.enable {
    home.packages = [
      inputs.walker.packages.${pkgs.system}.default
    ];
    home.file = {
      ".config/walker".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Git/vicnotor/nixos/modules/home-manager/toggleable/walker";
    };
  };
}
