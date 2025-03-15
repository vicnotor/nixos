{config, ...}: {
  home = {
    file = {
      ".local/bin".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/vicnotor/nixos-xx/extraFiles/shellScripts;
    };
  };
}
