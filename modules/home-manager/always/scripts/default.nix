{config, ...}: {
  home = {
    file = {
      ".local/bin".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/vicnotor/nixos/extraFiles/shellScripts;
    };
  };
}
