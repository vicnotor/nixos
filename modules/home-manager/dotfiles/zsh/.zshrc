HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

# User configuration

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Keybindings
bindkey -s ^f "tmux-sessionizer\n"
bindkey -s ^t "tmux attach\n"
bindkey -s ^g "open-current-dir\n"
bindkey -s ● "tmux-home\n"

# Completion
autoload -Uz compinit
compinit

# Fix slow git autocompletion
__git_files () {
    _wanted files expl 'local files' _files }

# Zsh options

# Keep history of `cd` as in with `pushd` and make `cd -<TAB>` work.
DIRSTACKSIZE=16
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_minus

# Ignore duplicate in history.
setopt hist_ignore_dups
# Nobody need flow control anymore. Troublesome feature.
setopt noflowcontrol

# I have to do this to correctly display the directory name when running
# tmux-sessionizer (I have no idea why)
cd .

# Zoxide
eval "$(zoxide init --cmd cd zsh)"
