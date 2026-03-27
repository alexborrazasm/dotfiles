# ~/.zshrc
ZSH_CONFIG_DIR="$HOME/.config/zsh"

eval "$(dircolors -b)"

# Enable completion system
autoload -Uz compinit
compinit

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}"

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Skip words when moving with Ctrl+Left/Right
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Avoid treating certain characters as part of a word
WORDCHARS=${WORDCHARS//\/[&.;]}

# Disable the bell sound on errors
setopt NO_BEEP

# Load environment variables (PATH, etc)
[[ -f "$ZSH_CONFIG_DIR/env.zsh" ]] && source "$ZSH_CONFIG_DIR/env.zsh"

# Load aliases
[[ -f "$ZSH_CONFIG_DIR/aliases.zsh" ]] && source "$ZSH_CONFIG_DIR/aliases.zsh"

# Load functions
[[ -f "$ZSH_CONFIG_DIR/functions.zsh" ]] && source "$ZSH_CONFIG_DIR/functions.zsh"

# Load plugins or framework (like zinit/antidote/etc)
[[ -f "$ZSH_CONFIG_DIR/plugins.zsh" ]] && source "$ZSH_CONFIG_DIR/plugins.zsh"

# Direnv hook
eval "$(direnv hook zsh)"
