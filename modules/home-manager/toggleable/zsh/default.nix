{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    zshModule.enable =
      lib.mkEnableOption "zsh module";
  };

  config = lib.mkIf config.zshModule.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autocd = true;
      dotDir = ".config/zsh";
      initContent = ''
        # Keybindings
        bindkey -s ^f "tmux-sessionizer\n"
        bindkey -s ^t "tmux attach\n"
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
      '';
      sessionVariables = {
        DIRSTACKSIZE = 16;
        HYPHEN_INSENSITIVE = "true";

        EDITOR = "nvim";
        BROWSER = "google-chrome-stable";
        TERMINAL = "ghostty";
        VISUAL = "nvim";
        FILE_PICKER = "thunar";

        # CHANGE THIS FOR DEFAULT WALLPAPER, ALONG WITH $HOME/Git/vicnotor/nixos/modules/home-manager/toggleable/hyprlandHm/default.nix
        WPDEFAULT = "${config.home.homeDirectory}/personal/Pictures/wallpapers/destiny.png";

        GIO_EXTRA_MODULES = "${pkgs.gvfs}/lib/gio/modules"; # potential thunar fix?
      };
      shellAliases = import ./aliases.nix;
    };
  };
}
