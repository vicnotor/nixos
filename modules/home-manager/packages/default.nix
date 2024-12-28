{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    alacritty # Terminal
    rofi-wayland # App launcher
    google-chrome
    inputs.swww.packages.${pkgs.system}.swww # Wallpaper service
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
    inputs.nixd.packages.${pkgs.system}.nixd # Nix lsp
    grim # screenshot tool
    slurp # select part of screen for screenshot
    grimblast # Hyprland wrapper for grim and slurp
    webcord # Discord agent
    hyprpicker # Color picker
    unrar

    # Languages
    nodejs
    (python3.withPackages (ps:
      with ps; [
        m2crypto # Needed for Python SSL support
        numpy
      ]))
    # python312
    # python312Packages.m2crypto # Needed for Python SSL support
    R
    yarn # Needed for vim ( TODO: find out what for exactly)

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
}
