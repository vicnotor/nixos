{
  lib,
  config,
  ...
}: {
  options = {
    thunarHmModule.enable =
      lib.mkEnableOption "Thunar home-manager module";
  };

  config = lib.mkIf config.thunarHmModule.enable {
    home.file = {
      ".config/Thunar/uca.xml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Git/vicnotor/nixos/modules/home-manager/toggleable/thunarHm/uca.xml";
    };
  };
}
