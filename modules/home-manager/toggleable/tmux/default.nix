{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    tmuxModule.enable =
      lib.mkEnableOption "tmux module";
  };

  config = lib.mkIf config.tmuxModule.enable {
    programs.tmux = {
      enable = true;
      shell = "${pkgs.zsh}/bin/zsh";
      shortcut = "a";
      baseIndex = 1;
      mouse = true;
      keyMode = "vi";
      clock24 = true;
      # disableConfirmationPrompt = true;

      plugins = with pkgs; [
        {
          plugin = tmuxPlugins.sensible;
          extraConfig = ''
            set -g @plugin 'tmux-plugins/tmux-sensible'
          '';
        }
        {
          plugin = tmuxPlugins.resurrect;
          extraConfig = ''
            set -g @plugin 'tmux-plugins/tmux-resurrect'
          '';
        }
      ];

      extraConfig = ''
        set -ga terminal-overrides ",screen-256color*:Tc" # Colors stuff
        set-option -sg set-titles # Title in DWM bar

        # These must exist
        bind C-a send-prefix
        bind a last-window

        # Copying and pasting in tmux
        bind -T copy-mode-vi v send-keys -X begin-selection
        bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -in -selection clipboard'

        # Custom key-binds
        bind-key -r f run-shell "tmux neww tmux-sessionizer"
        bind-key -r h run-shell "tmux-home"

        # Style by JackDerksen/tmux
        set -g status-justify left
        set -g status-position bottom
        set -g status-left-length 200     # increase length (from 10)
        set -g status-style 'bg=default'  # transparent background

        set -g status-left '#[fg=#2b2a30,bg=default]#[fg=#b4befe,bg=#2b2a30] #S #[fg=#2b2a30,bg=default]#[fg=#45475a,bg=default] |'
        # set -g status-right '#[fg=#2b2a30,bg=default]#[fg=#f2dcdc,bg=#2b2a30]%d/%m/%y %H:%M#[fg=#2b2a30,bg=default]'
        set -g status-right ""
        set -g window-status-current-format '#[fg=#2b2a30,bg=default] #[fg=#b4befe,bg=#2b2a30]#I #W#[fg=#2b2a30,bg=default]'
        set -g window-status-format '#[fg=gray,bg=default]  #I #W '

        set -g window-status-last-style 'fg=white,bg=default'
        set -g pane-border-style 'fg=#b4befe'
        set -g pane-active-border-style 'fg=#b4befe'
        set -g message-command-style bg=default,fg=#f2dcdc
        set -g message-style bg=default,fg=#f2dcdc
        set -g mode-style bg=#3b3e40,fg=#f06010

        # tmux-plugins/tmux-prefix-highlight support
        set -g @prefix_highlight_output_prefix "#[fg=#e0af68]#[bg=#16161e]#[fg=#16161e]#[bg=#e0af68]"
        set -g @prefix_highlight_output_suffix ""

        # Proper colors
        set-option -sa terminal-features ',ghostty:RGB' # Makes sure that colors in tmux are the same as without tmux

        # Undercurl support
        set-option -ga terminal-features ",ghostty:usstyle"

        # vim-tmux-navigator
        # Smart pane switching with awareness of Vim splits.
        # See: https://github.com/christoomey/vim-tmux-navigator
        is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
            | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?nvim?x?|fzf)(diff)?$'"

        bind-key -r 'C-h' if-shell "$is_vim" 'send-keys F1'  'select-pane -L'
        bind-key -r 'C-j' if-shell "$is_vim" 'send-keys F2'  'select-pane -D'
        bind-key -r 'C-k' if-shell "$is_vim" 'send-keys F3'  'select-pane -U'
        bind-key -r 'C-l' if-shell "$is_vim" 'send-keys F4'  'select-pane -R'

        bind-key -T copy-mode-vi 'C-h' select-pane -L
        bind-key -T copy-mode-vi 'C-j' select-pane -D
        bind-key -T copy-mode-vi 'C-k' select-pane -U
        bind-key -T copy-mode-vi 'C-l' select-pane -R

        # Undercurl support again? (taken from github:folke/tokyonight)
        set -g default-terminal "''${TERM}"
        set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
        set -as terminal-overrides ',*:Setulc=\E[58::2::::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colours - needs tmux-3.0

        # Image preview workaround
        set -g allow-passthrough on
        set -ga update-environment TERM
        set -ga update-environment TERM_PROGRAM
      '';
    };
  };
}
