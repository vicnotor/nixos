{...}: {
  # DO NOT CHANGE!!!!!!!!!!! See https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion
  system.stateVersion = "24.11";

  services = {
    libinput.enable = true;
    openssh.enable = true;
    printing.enable = true;
  };
  programs = {
    # AppImage support
    appimage.enable = true;
    appimage.binfmt = true;

    dconf.enable = true;
  };

  hardware.enableAllFirmware = true;

  fileSystems."/home/vic/.cache/google-chrome" = {
    fsType = "tmpfs";
    options = [
      "size=512M"
      "mode=700"
      "uid=1000"
      "gid=100"
    ];
  };

  # Mounting SATA drive
  # fileSystems."/home/vic/mnt/sata" = {
  #   device = "/dev/disk/by-label/SATA";
  #   fsType = "ntfs-3g";
  #   options = ["rw" "uid=1000"];
  # };
}
