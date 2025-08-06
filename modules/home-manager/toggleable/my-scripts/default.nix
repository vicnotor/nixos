{
  lib,
  config,
  ...
}: {
  options = {
    my-sciptsModule.enable =
      lib.mkEnableOption "My shell scripts module";
  };

  config = lib.mkIf config.my-sciptsModule.enable {
    home = {
      file = {
        ".local/bin".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Git/vicnotor/nixos/modules/home-manager/toggleable/my-scripts";
      };
    };
  };
}
