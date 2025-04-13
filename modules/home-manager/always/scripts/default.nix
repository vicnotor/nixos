{config, ...}: {
  home = {
    file = {
      ".local/bin".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Git/vicnotor/nixos/extraFiles/shellScripts";
    };
  };
}
