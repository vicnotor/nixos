{ pkgs, lib, config, ... }: {

  options = {
    tmux.enable = 
      lib.mkEnableOption "enables zsh module";
  };

  config = lib.mkIf config.tmux.enable {
    programs.tmux = {
      enable = true;
      shell = "${pkgs.zsh}/bin/zsh";
      terminal = "tmux-256color";
      escapeTime = 1;
      shortcut = "a";
      baseIndex = 1;
      mouse = true;
      historyLimit = 5000;
      keyMode = "vi";
      clock24 = true;
      disableConfirmationPrompt = true;

      plugins = with pkgs; [
        {
          plugin = tmuxPlugins.resurrect;
          extraConfig = ''
            set -g @plugin 'tmux-plugins/tmux-resurrect'
          '';
        }
        {
          plugin = tmuxPlugins.continuum;
          extraConfig = ''
            set -g @plugin 'tmux-plugins/tmux-continuum'
            set -g @continuum-save-interval '5'
          '';
        }
      ];

        extraConfig = ''
        set -ga terminal-overrides ",screen-256color*:Tc" # Colors stuff
        set-option -sg set-titles # Title in DWM bar

        # Copying and pasting in tmux
        bind -T copy-mode-vi v send-keys -X begin-selection
        bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -in -selection clipboard'

        # Custom key-binds
        bind-key -r f run-shell "tmux neww tmux-sessionizer"
        bind-key -r g run-shell "open-current-dir"
        bind-key -r h run-shell "tmux-home"

        # Style by JackDerksen/tmux
        set -g status-justify left
        set -g status-position bottom
        set -g status-left-length 200     # increase length (from 10)
        set -g status-style 'bg=default'  # transparent background

        set -g status-left '#[fg=#2b2a30,bg=default]#[fg=#b4befe,bg=#2b2a30] #S #[fg=#2b2a30,bg=default]#[fg=#45475a,bg=default] |'
        set -g status-right '#[fg=#2b2a30,bg=default]#[fg=#f2dcdc,bg=#2b2a30]%d/%m/%y %H:%M#[fg=#2b2a30,bg=default]'
        set -g window-status-current-format '#[fg=#2b2a30,bg=default] #[fg=#b4befe,bg=#2b2a30]#I #W#[fg=#2b2a30,bg=default]'
        set -g window-status-format '#[fg=gray,bg=default]  #I #W '

        set -g window-status-last-style 'fg=white,bg=default'
        set -g pane-border-style 'fg=#b4befe'
        set -g pane-active-border-style 'fg=#b4befe'
        set -g message-command-style bg=default,fg=#f2dcdc
        set -g message-style bg=default,fg=#f2dcdc
        set -g mode-style bg=#3b3e40,fg=#ff6b00

        # tmux-plugins/tmux-prefix-highlight support
        set -g @prefix_highlight_output_prefix "#[fg=#e0af68]#[bg=#16161e]#[fg=#16161e]#[bg=#e0af68]"
        set -g @prefix_highlight_output_suffix ""

        # Proper colors
        set-option -sa terminal-features ',alacritty:RGB' # Makes sure that colors in tmux are the same as without tmux

        # Undercurl support
        set-option -ga terminal-features ",alacritty:usstyle"

        # Neovim wants this
        set-option -g focus-events on


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
      '';
    };
  };
}
