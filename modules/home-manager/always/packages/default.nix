{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    alejandra # Nix formatting
    aseprite
    brightnessctl
    discord
    evince # pdf
    fastfetch # Neofetch
    fd # Finding files
    fiji # ImageJ2 distribution
    gimp
    google-chrome
    grim # screenshot tool
    grimblast # Hyprland wrapper for grim and slurp
    hyprpicker # Color picker
    libreoffice
    networkmanagerapplet
    inputs.nixd.packages.${pkgs.system}.default # nixd: Nix lsp
    obs-studio
    onedrive
    openssl # Needed for onedrive
    pandoc # markdown to pdf
    pavucontrol # Audio controls
    playerctl # Needed for pausing, skipping songs, etc.
    qimgv # Image viewer
    qbittorrent
    rofi-wayland # App launcher
    slurp # select part of screen for screenshot
    snes9x-gtk
    spotify
    inputs.swww.packages.${pkgs.system}.default # swww: wallpaper service
    teams-for-linux
    texlive.combined.scheme-full # Needed for pandoc and for knitting RMarkdown
    thunderbird-latest # Mail client
    unrar
    wev # xev for wayland
    wl-clipboard # Clipboard manager
    wl-gammarelay-rs # blue light filter
    xorg.xeyes # Run `xeyes` to show xwayland windows
    zapzap # Whatsapp
    zotero

    # Languages
    nodejs
    inputs.zig.packages.${pkgs.system}.default # Zig compiler
  ];
}
