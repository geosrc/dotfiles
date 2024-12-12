# ~/.zshrc: Loaded only for interactive shell sessions.
# It is loaded whenever you open a new terminal window or launch a subshell from a terminal window.

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# zstyle ':completion:*' auto-description 'specify: %d'
# zstyle ':completion:*' completer _expand _complete _correct _approximate
# zstyle ':completion:*' format 'Completing %d'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' menu select=2
# eval "$(dircolors -b)"
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' list-colors ''
# zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
# zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
# zstyle ':completion:*' menu select=long
# zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
# zstyle ':completion:*' use-compctl false
# zstyle ':completion:*' verbose true

# zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
# zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

#export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin::$PATH

# Load machine specific config
if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

# Load custom prompt tool, if installed
if type "starship" > /dev/null; then
  # Install (https://starship.rs/guide/):
  # > cargo install starship --locked
  export STARSHIP_CONFIG=~/dotfiles/starship.toml
  eval "$(starship init zsh)"
else
  # Prompt
  autoload -Uz promptinit
  promptinit
  prompt suse
fi

if [ -f ~/dotfiles/.zsh.d/antigen.zsh ]; then
  source ~/dotfiles/.zsh.d/antigen.zsh

  # Syntax highlighting bundle.
  antigen bundle zsh-users/zsh-completions
  antigen bundle zsh-users/zsh-autosuggestions
  antigen bundle zsh-users/zsh-syntax-highlighting
  #antigen bundle zsh-users/zsh-history-substring-search # load after zsh-syntax-highlighting

  antigen apply

  #bindkey '^[[A' history-substring-search-up # or '\eOA'
  #bindkey '^[[B' history-substring-search-down # or '\eOB'
  #HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
fi

# Aliases
alias l='ls --color=always -la'
alias upg="sudo apt update && sudo apt upgrade -y"