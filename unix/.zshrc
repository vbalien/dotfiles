# zsh options
SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt interactivecomments

# Completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# Load plugins
if [[ "$OSTYPE" == "darwin"* ]]; then
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
elif grep -q "fedora" /etc/os-release; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source /usr/share/zsh-history-substring-search/zsh-history-substring-search.zsh
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
else
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Key mapping
bindkey -e
bindkey "^P"   history-substring-search-up
bindkey "^N"   history-substring-search-down
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
bindkey '^[[Z' reverse-menu-complete

# Style
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=none,fg=magenta,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=none

# plugin options
HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS='I'
HISTORY_SUBSTRING_SEARCH_PREFIXED=true
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=true

# Alias
alias vim=nvim

if [[ "$OSTYPE" == "linux"* ]]; then
  alias open=xdg-open
fi

# Prompt
eval "$(starship init zsh)"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# cargo
export PATH="$HOME/.cargo/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# spicetify
export PATH=$PATH:/home/elnyan/.spicetify
export PATH="$PATH:$HOME/.local/bin"

# screen fetch
pfetch
