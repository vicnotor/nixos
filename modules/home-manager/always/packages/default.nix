{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    aspell # Spell checker
    aspellDicts.en
    bibclean # For BibTeX files
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
    ltex-ls-plus
    mermaid-cli
    networkmanagerapplet
    inputs.nix-alien.packages.${pkgs.system}.default
    obs-studio
    kdePackages.okular
    onedrive
    openssl # Needed for onedrive
    pandoc # markdown to pdf
    pavucontrol # Audio controls
    pinta
    playerctl # Needed for pausing, skipping songs, etc.
    qimgv # Image viewer
    qbittorrent
    snes9x-gtk
    spotify
    sshfs
    stremio
    texlive.combined.scheme-full
    tree-sitter
    thunderbird-latest # Mail client
    unrar
    wev # xev for wayland
    wl-clipboard # Clipboard manager
    wl-gammarelay-rs # blue light filter
    xorg.xeyes # Run `xeyes` to show xwayland windows
    youtube-music
    zapzap # Whatsapp
    zip
    zotero-beta

    # Languages
    alejandra # Nix formatting
    bash-language-server
    inputs.nixd.packages.${pkgs.system}.default # nixd: Nix lsp
  ];
}
