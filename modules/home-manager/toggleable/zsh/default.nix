{
  lib,
  config,
  ...
}: {
  options = {
    zshModule.enable =
      lib.mkEnableOption "enables zsh module";
  };

  config = lib.mkIf config.zshModule.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autocd = true;
      dotDir = ".config/zsh";
      initExtra = ''
        # Keybindings
        bindkey -s ^f "tmux-sessionizer\n"
        bindkey -s ^t "tmux attach\n"
        bindkey -s ^g "open-current-dir\n"
        bindkey -s ● "tmux-home\n"

        # Fixes slow git autocompletion
        __git_files () {
          _wanted files expl 'local files' _files
        }

        # Keep history of `cd` as in with `pushd` and make `cd -<TAB>` work.
        setopt auto_pushd
        setopt pushd_ignore_dups
        setopt pushd_minus

        # Nobody need flow control anymore.
        setopt noflowcontrol

        cd . # tmux-sessionizer fix that fixes the current dir not showing in the prompt
      '';
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "sudo"
          "direnv"
        ];
        theme = "robbyrussell";
      };
      profileExtra = ''
        if [ -z $DISPLAY ] && [ $(tty) = /dev/tty1 ] && uwsm check may-start; then
          exec uwsm start -S hyprland-uwsm.desktop
        fi
        if [ -z $DISPLAY ] && [ $(tty) = /dev/tty2 ]; then
          exec Hyprland
        fi
      '';
      sessionVariables = {
        DIRSTACKSIZE = 16;
        HYPHEN_INSENSITIVE = "true";
      };
      shellAliases = import ./aliases.nix;
    };
  };
}
