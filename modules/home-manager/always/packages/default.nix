{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    rofi-wayland # App launcher
    google-chrome
    inputs.swww.packages.${pkgs.system}.default # swww: wallpaper service
    brightnessctl
    playerctl # Needed for pausing, skipping songs, etc.
    onedrive
    openssl # Needed for onedrive
    networkmanagerapplet
    pavucontrol # Audio controls
    wl-clipboard # Clipboard manager
    pandoc # markdown to pdf
    texlive.combined.scheme-small # Needed for pandoc
    spotify
    qimgv # Image viewer
    wl-gammarelay-rs # blue light filter
    wev # xev for wayland
    xorg.xeyes # Run `xeyes` to show xwayland windows
    evince # pdf
    fastfetch # Neofetch
    fd # Finding files
    fzf # Amazing tool
    zapzap # Whatsapp
    libreoffice
    teams-for-linux
    thunderbird-latest # Mail client
    obs-studio
    mpv # Video player
    alejandra # Nix formatting
    inputs.nixd.packages.${pkgs.system}.default # nixd: Nix lsp
    grim # screenshot tool
    slurp # select part of screen for screenshot
    grimblast # Hyprland wrapper for grim and slurp
    webcord # Discord agent
    hyprpicker # Color picker
    unrar
    godot_4
    pulsemixer # cli audio mixer
    youtube-music

    # Languages
    nodejs
    yarn # Needed for vim ( TODO: find out what for exactly)
    inputs.zig.packages.${pkgs.system}.default # Zig compiler

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
}
