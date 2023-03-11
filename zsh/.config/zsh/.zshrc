# Load plugin manager
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# Load plugins
plug "hlissner/zsh-autopair"
plug "zap-zsh/vim"
plug "zap-zsh/fzf"
plug "Aloxaf/fzf-tab"
plug "zsh-users/zsh-autosuggestions"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#999999"
plug "zsh-users/zsh-syntax-highlighting"

# Load other config files
source "${XDG_CONFIG_HOME}/zsh/aliases"
source "${XDG_CONFIG_HOME}/zsh/prompt"
source "${XDG_CONFIG_HOME}/zsh/external/bd.zsh"

# Load custom functions
fpath=($ZDOTDIR/external $fpath)

# Autoload completion engine
autoload -U compinit; compinit

# Apply completion to dotfiles
_comp_options+=(globdots)

# Automatically adds a / after folder names 
setopt AUTO_PARAM_SLASH

# Allows incorrect case for completion
unsetopt CASE_GLOB

# Push the currently visited directory into the stack.
setopt AUTO_PUSHD

# Do not store duplicate directories in the stack.
setopt PUSHD_IGNORE_DUPS

# Bind Ctrl+G instead of Ctrl+l for clear screen (because Ctrl+L is used in tmux)
bindkey -r '^l'
bindkey -r '^g'
bindkey -s '^g' 'clear\n'

# Bind "delete" key to actually delete next character instead of... whatever weird stuff it does by default
bindkey "^[[3~" delete-char
