{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    aseprite
    brightnessctl
    discord
    evince # pdf
    fastfetch # Neofetch
    fd # Finding files
    gimp
    google-chrome
    grimblast # Hyprland wrapper for grim and slurp
    hyprpicker # Color picker
    libreoffice
    networkmanagerapplet
    obs-studio
    onedrive
    openssl # Needed for onedrive
    pandoc # markdown to pdf
    pavucontrol # Audio controls
    playerctl # Needed for pausing, skipping songs, etc.
    qimgv # Image viewer
    qbittorrent
    rofi-wayland # App launcher
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
    zotero-beta

    # Languages
    alejandra # Nix formatting
    bash-language-server
    mdformat # Markdown formatting
    inputs.nixd.packages.${pkgs.system}.default # nixd: Nix lsp
  ];
}
