{ pkgs, lib, ... }: {

  imports = [
    ./hyprland
    ./waybar
    ./dotfiles
    ./zsh
    ./tmux
  ];

  hyprland.enable = 
    lib.mkDefault true;
  waybar.enable = 
    lib.mkDefault true;
  dotfiles.enable = 
    lib.mkDefault true;
  zsh.enable = 
    lib.mkDefault true;
  tmux.enable = 
    lib.mkDefault true;
}
