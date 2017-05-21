export ZSH=/Users/aun/.oh-my-zsh

ZSH_THEME="sammy-custom"

plugins=(zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

. ~/.zsh/aliases
. ~/.zsh/config
. ~/.zsh/functions

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
