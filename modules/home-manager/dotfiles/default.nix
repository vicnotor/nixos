{ pkgs, lib, config, ... }: {

  options = {
    dotfiles.enable = 
      lib.mkEnableOption "enables importing of all dotfiles";
  };

  config = lib.mkIf config.dotfiles.enable {
    home.file = {
      ".config/Thunar".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/xxheyhey/nixos-xx/dotfiles/Thunar;
      ".config/alacritty".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/xxheyhey/nixos-xx/dotfiles/alacritty;
      ".config/dunst".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/xxheyhey/nixos-xx/dotfiles/dunst;
      ".config/htop".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/xxheyhey/nixos-xx/dotfiles/htop;
      ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/xxheyhey/nixos-xx/dotfiles/nvim;
      ".config/onedrive".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/xxheyhey/nixos-xx/dotfiles/onedrive;
      ".config/rofi".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/xxheyhey/nixos-xx/dotfiles/rofi;
      ".config/tmux".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/xxheyhey/nixos-xx/dotfiles/tmux;
      ".config/zsh".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/xxheyhey/nixos-xx/dotfiles/zsh;
      ".config/mimeapps.list".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/xxheyhey/nixos-xx/dotfiles/mimeapps.list;
      ".config/pavucontrol.ini".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/xxheyhey/nixos-xx/dotfiles/pavucontrol.ini;
      ".config/user-dirs.dirs".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/xxheyhey/nixos-xx/dotfiles/user-dirs.dirs;
      ".zshenv".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/xxheyhey/nixos-xx/dotfiles/.zshenv;
    };
  };
}
