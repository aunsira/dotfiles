export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="sammy-custom"

plugins=(zsh-autosuggestions zsh-syntax-highlighting git-open)

source $ZSH/oh-my-zsh.sh

. /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
. /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. ~/.zsh/aliases
. ~/.zsh/config
. ~/.zsh/functions

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
