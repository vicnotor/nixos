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
        DIRSTACKSIZE=16
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
        EDITOR = "nvim";
        VISUAL = "nvim";
        LANG = "en_US.UTF-8";
        LC_ALL = "en_US.UTF-8";
        FZF_DEFAULT_OPTS = ''
          --color=fg:#908caa,bg:#000000,hl:#f38ba8
          --color=fg+:#e0def4,bg+:#393552,hl+:#f38ba8
          --color=border:#44415a,header:#3e8fb0,gutter:#000000
          --color=spinner:#f6c177,info:#9ccfd8,separator:#44415a
          --color=pointer:#f5e0dc,marker:#eb6f92,prompt:#908caa
          --layout=reverse
          --border
        '';
      };
      shellAliases = import ./aliases.nix;
    };
  };
}
