export ZSH=/Users/aun/.oh-my-zsh

ZSH_THEME="sammy"

plugins=(git tmux postgres rails zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export PATH=/usr/local/bin:$PATH
export LANG=en_US.UTF-8

# Ruby environment config
if [ -x "$(command -v rbenv)" ]; then
  eval "$(rbenv init -)"
fi

# aliases
alias ...="cd ../.."                        # go up parent dir twice
alias ....="cd ../../.."                    # .. thrice
alias .....="cd ../../../.."                # .. four times
alias ......="cd ../../../../.."            # .. five times
alias cd..="cd .."
alias fuck='eval $(thefuck $(fc -ln -1))'
alias FUCK='fuck'
alias tmux='tmux -2'
alias vimn='vim -u NONE'
alias cls='clear'
alias p8='ping 8.8.8.8'
alias ls="ls -AFG"
alias ll="ls -FGlh"
alias gl='git lg'
alias glp='git lg -p'
alias e='exit'
alias rs='rails s -p 3001'

export CDPATH=$CDPATH:$HOME/code/git:$HOME/code/git/skilllane-web:$HOME/code

source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

# Don't exit on ctrl-d
set -o ignoreeof

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
       find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
        sed s/^..//) 2> /dev/null'
