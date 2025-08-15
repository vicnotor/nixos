{lib, ...}: {
  imports = [
    # Always enabled
    ./always/boot
    ./always/environment
    ./always/keyboard
    ./always/location
    ./always/misc
    ./always/networking
    ./always/nix
    ./always/packages
    ./always/users

    # Toggleable (see below)
    ./toggleable/bluetooth
    ./toggleable/dolphin
    ./toggleable/fonts
    ./toggleable/graphics
    ./toggleable/hyprland
    ./toggleable/keyd
    ./toggleable/laptop
    ./toggleable/nh
    ./toggleable/nix-ld
    ./toggleable/nvidia
    ./toggleable/nvidiahybrid
    ./toggleable/polkit
    ./toggleable/sound
    ./toggleable/ssd
    ./toggleable/steam
    ./toggleable/stylix
    ./toggleable/tailscale
    ./toggleable/thunar
    ./toggleable/virtualisation
    ./toggleable/virtualisation-guest
    ./toggleable/xdgportal
    ./toggleable/zsh
  ];

  # Enabled by default
  bluetoothModule.enable = lib.mkDefault true;
  fontsModule.enable = lib.mkDefault true;
  graphicsModule.enable = lib.mkDefault true;
  hyprlandModule.enable = lib.mkDefault true;
  keydModule.enable = lib.mkDefault true;
  laptopModule.enable = lib.mkDefault true;
  nhModule.enable = lib.mkDefault true;
  nix-ldModule.enable = lib.mkDefault true;
  nvidiaModule.enable = lib.mkDefault true;
  nvidiahybridModule.enable = lib.mkDefault true;
  polkitModule.enable = lib.mkDefault true;
  soundModule.enable = lib.mkDefault true;
  ssdModule.enable = lib.mkDefault true;
  steamModule.enable = lib.mkDefault true;
  stylixModule.enable = lib.mkDefault true;
  tailscaleModule.enable = lib.mkDefault true;
  thunarModule.enable = lib.mkDefault true;
  virtualisationModule.enable = lib.mkDefault true;
  xdgportalModule.enable = lib.mkDefault true;
  zshModule.enable = lib.mkDefault true;

  # Disabled by default
  dolphinModule.enable = lib.mkDefault false;
  virtualisation-guestModule.enable = lib.mkDefault false;
}
