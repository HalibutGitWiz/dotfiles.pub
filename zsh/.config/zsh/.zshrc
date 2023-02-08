[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
source "${XDG_CONFIG_HOME}/zsh/aliases"
source "${XDG_CONFIG_HOME}/zsh/prompt"
# source "${XDG_CONFIG_HOME}/zsh/external/cursor_mode"
source "${XDG_CONFIG_HOME}/zsh/external/bd.zsh"
source "${XDG_CONFIG_HOME}/zsh/completion.zsh"
fpath=($ZDOTDIR/external $fpath)

# Autoload du moteur de complétion
autoload -U compinit; compinit

# Applique la complétion aux dotfiles
_comp_options+=(globdots)

# Plugins
plug "hlissner/zsh-autopair"
plug "zap-zsh/vim"
plug "zap-zsh/fzf"
plug "zap-zsh/exa"
plug "Aloxaf/fzf-tab"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"

# Ajoute un / à la fin des noms de répertoires
setopt AUTO_PARAM_SLASH

# Allows incorrect case for completion
unsetopt CASE_GLOB

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' (%b)'

# Push the current directory visited on to the stack.
setopt AUTO_PUSHD

# Do not store duplicate directories in the stack.
setopt PUSHD_IGNORE_DUPS

# Neovim mode
# bindkey -v
# export KEYTIMEOUT=1
# autoload -Uz cursor_mode && cursor_mode
# zmodload zsh/complist
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'j' vi-down-line-or-history
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# autoload -Uz edit-command-line
# zle -N edit-command-line
# bindkey -M vicmd v edit-command-line

# Bind Ctrl+G instead of Ctrl+l for clear screen (because Ctrl+L is used in tmux)
bindkey -r '^l'
bindkey -r '^g'
bindkey -s '^g' 'clear\n'
