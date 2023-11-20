SAVEHIST=1000
HISTFILE=~/.zsh_history

# Completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
bindkey '^[[Z' reverse-menu-complete

if [[ "$OSTYPE" == "darwin"* ]]; then
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
else
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

alias open=xdg-open
fi

# Syntax highlight
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none


export PATH="$HOME/.cargo/bin:$PATH"

# Alias
alias vim=nvim

# Prompt
eval "$(starship init zsh)"

# ScreenFetch
pfetch

# bun completions
[ -s "/Users/vbalien/.bun/_bun" ] && source "/Users/vbalien/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
