{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra # Nix formatting
    bash-language-server
    brightnessctl
    discord
    evince # pdf
    eza
    fd # Finding files
    ffmpeg
    ghostscript
    gimp3
    google-chrome
    gtk3 # Just for `gtk-launch <.desktop file>`
    imagemagick
    inkscape
    jq
    mermaid-cli
    networkmanagerapplet
    nixd # Nix lsp
    obs-studio
    kdePackages.okular
    onedrive
    openssl # Needed for onedrive
    pandoc # markdown to pdf
    pavucontrol # Audio controls
    pinta # Paint
    playerctl # Needed for pausing, skipping songs, etc.
    protonvpn-gui
    qimgv # Image viewer
    qbittorrent
    spotify
    sshfs
    tree-sitter
    thunderbird-latest # Mail client
    unrar
    vulkan-tools
    wev # xev for wayland
    wl-clipboard # Clipboard manager
    wl-gammarelay-rs # blue light filter
    wl-screenrec
    xorg.xeyes # Run `xeyes` to show xwayland windows
    yt-dlp
    zapzap # Whatsapp
    zip
    zotero-beta
  ];
}
