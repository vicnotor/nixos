{config, ...}: {
  home = {
    file = {
      "bin".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/xxheyhey/nixos-xx/extraFiles/shellScripts;
    };
  };
}
