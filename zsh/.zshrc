# ~/.zshrc
ZSH_CONFIG_DIR="$HOME/.config/zsh"

# Launch Hyprland with uwsm
if uwsm check may-start; then
  exec uwsm start hyprland-uwsm.desktop
fi

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

# Load environment variables (PATH, etc)
[[ -f "$ZSH_CONFIG_DIR/env.zsh" ]] && source "$ZSH_CONFIG_DIR/env.zsh"

# Load aliases
[[ -f "$ZSH_CONFIG_DIR/aliases.zsh" ]] && source "$ZSH_CONFIG_DIR/aliases.zsh"

# Load functions
[[ -f "$ZSH_CONFIG_DIR/functions.zsh" ]] && source "$ZSH_CONFIG_DIR/functions.zsh"

# Load plugins or framework (like zinit/antidote/etc)
[[ -f "$ZSH_CONFIG_DIR/plugins.zsh" ]] && source "$ZSH_CONFIG_DIR/plugins.zsh"
