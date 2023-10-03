# Completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
bindkey '^[[Z' reverse-menu-complete

# Syntax highlight
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Alias
alias vim=nvim
alias open=xdg-open

# Prompt
eval "$(starship init zsh)"
