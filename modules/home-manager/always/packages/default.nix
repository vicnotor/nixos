{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    alejandra # Nix formatting
    bash-language-server
    brightnessctl
    discord
    evince # pdf
    fastfetch # Neofetch
    fd # Finding files
    ffmpeg
    ghostscript
    gimp
    google-chrome
    grimblast # Hyprland wrapper for grim and slurp
    gtk3 # Just for `gtk-launch <.desktop file>`
    hyprpicker # Color picker
    imagemagick
    inkscape
    jq
    libreoffice
    mermaid-cli
    networkmanagerapplet
    inputs.nixd.packages.${pkgs.system}.default # nixd: Nix lsp
    obs-studio
    kdePackages.okular
    onedrive
    openssl # Needed for onedrive
    pandoc # markdown to pdf
    pavucontrol # Audio controls
    pinta # Paint
    playerctl # Needed for pausing, skipping songs, etc.
    qimgv # Image viewer
    qbittorrent
    snes9x-gtk
    spotify
    sshfs
    stremio
    tree-sitter
    thunderbird-latest # Mail client
    unrar
    vulkan-tools
    wev # xev for wayland
    wl-clipboard # Clipboard manager
    wl-gammarelay-rs # blue light filter
    xorg.xeyes # Run `xeyes` to show xwayland windows
    youtube-music
    yt-dlp
    zapzap # Whatsapp
    zip
    zotero-beta
  ];
}
