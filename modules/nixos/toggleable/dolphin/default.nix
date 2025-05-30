{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    dolphinModule.enable =
      lib.mkEnableOption "dolphin module";
  };

  config = lib.mkIf config.dolphinModule.enable {
    environment.systemPackages = with pkgs.kdePackages; [
      dolphin
      qtsvg
      kio-fuse #to mount remote filesystems via FUSE
      kio-extras #extra protocols support (sftp, fish and more)
    ];
    services = {
      gvfs.enable = true; # Mount, trash, and other functionalities
      tumbler.enable = true; # Thumbnail support for images
    };
  };
}
