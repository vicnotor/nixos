{ pkgs, lib, config, ... }: {

  options = {
    dotfiles.enable = 
      lib.mkEnableOption "enables importing of all dotfiles";
  };

  config = lib.mkIf config.dotfiles.enable {
    home.file = {
      ".config/alacritty".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/xxheyhey/nixos-xx/dotfiles/alacritty;
      # ".config/dunst".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/xxheyhey/nixos-xx/dotfiles/dunst;
      ".config/htop".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/xxheyhey/nixos-xx/dotfiles/htop;
      ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/xxheyhey/nixos-xx/dotfiles/nvim;
      ".config/onedrive".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/xxheyhey/nixos-xx/dotfiles/onedrive;
      ".config/rofi".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/xxheyhey/nixos-xx/dotfiles/rofi;
    };
  };
}
