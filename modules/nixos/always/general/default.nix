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
  };
}
