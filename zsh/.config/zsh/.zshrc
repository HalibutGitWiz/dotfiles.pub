[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
source "${XDG_CONFIG_HOME}/zsh/aliases"
source "${XDG_CONFIG_HOME}/zsh/prompt"
source "${XDG_CONFIG_HOME}/zsh/external/bd.zsh"
fpath=($ZDOTDIR/external $fpath)

# Autoload du moteur de complétion
autoload -U compinit; compinit

# Applique la complétion aux dotfiles
_comp_options+=(globdots)

# Plugins
plug "hlissner/zsh-autopair"
plug "zap-zsh/vim"
plug "zap-zsh/fzf"
plug "Aloxaf/fzf-tab"
plug "zsh-users/zsh-autosuggestions"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#999999"
plug "zsh-users/zsh-syntax-highlighting"

# Automatically adds a / after foler names 
setopt AUTO_PARAM_SLASH

# Allows incorrect case for completion
unsetopt CASE_GLOB

# Push the current directory visited on to the stack.
setopt AUTO_PUSHD

# Do not store duplicate directories in the stack.
setopt PUSHD_IGNORE_DUPS

# Bind Ctrl+G instead of Ctrl+l for clear screen (because Ctrl+L is used in tmux)
bindkey -r '^l'
bindkey -r '^g'
bindkey -s '^g' 'clear\n'
