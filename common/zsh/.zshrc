if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/.zsh/0-env.zsh
source $HOME/.zsh/1-ohmyzsh.zsh
source $HOME/.zsh/2-alias.zsh

[[ ! -f ~/.zsh/.p10k.zsh ]] || source ~/.zsh/.p10k.zsh