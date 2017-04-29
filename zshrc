export ZSH=/Users/aun/.oh-my-zsh

ZSH_THEME="sammy-custom"

plugins=(tmux postgres rails zsh-autosuggestions zsh-syntax-highlighting git-open)

source $ZSH/oh-my-zsh.sh

. ~/.zsh/aliases
. ~/.zsh/config
. ~/.zsh/functions

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
