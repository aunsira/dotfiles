export ZSH=/Users/aun/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git tmux postgres rails zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export PATH=/usr/local/bin:$PATH
export LANG=en_US.UTF-8

# Ruby environment config
eval "$(rbenv init -)"

# The Fuck plugin
alias fuck='eval $(thefuck $(fc -ln -1))'
alias FUCK='fuck'

export CDPATH="~/code/git/skilllane-web/:~/code/git/:~/code/:"

