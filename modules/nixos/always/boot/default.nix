{...}: {
  boot = {
    loader.systemd-boot = {
      enable = true;
      configurationLimit = 100;
      consoleMode = "max";
    };
    loader.efi.canTouchEfiVariables = true;
    extraModprobeConfig = ''
      options snd_hda_intel power_save=0
    '';
    supportedFilesystems = ["ntfs"];
  };
}
