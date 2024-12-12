{ pkgs, lib, config, ... }: {

  options = {
    dotfiles.enable = 
      lib.mkEnableOption "enables importing of all dotfiles";
  };

  config = lib.mkIf config.dotfiles.enable {
    home.file = {
      # # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;
      ".config/Thunar".source = ./Thunar;
      ".config/alacritty".source = ./alacritty;
      ".config/dunst".source = ./dunst;
      ".config/htop".source = ./htop;
      ".config/nvim".source = ./nvim;
      ".config/onedrive".source = ./onedrive;
      ".config/rofi".source = ./rofi;
      ".config/tmux".source = ./tmux;
      ".config/zsh".source = ./zsh;
      ".config/mimeapps.list".source = ./mimeapps.list;
      ".config/pavucontrol.ini".source = ./pavucontrol.ini;
      ".config/user-dirs.dirs".source = ./user-dirs.dirs;
      ".zshenv".source = ./.zshenv;
    };
  };
}
