{...}: {

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

  # Mounting SATA drive
  # fileSystems."/home/vic/mnt/sata" = {
  #   device = "/dev/disk/by-label/SATA";
  #   fsType = "ntfs-3g";
  #   options = ["rw" "uid=1000"];
  # };
}
