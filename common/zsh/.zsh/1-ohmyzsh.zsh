ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  # -- CUSTOM PLUGINS
  zsh-fzf-history-search
  zsh-autosuggestions
  fast-syntax-highlighting
  you-should-use
)

source $ZSH/oh-my-zsh.sh

# ignore history when prefix with space
setopt HIST_IGNORE_SPACE

# disable auto pushd
unsetopt autopushd
