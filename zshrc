. ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
. ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. ~/.zsh/zsh-completions/zsh-completions.plugin.zsh
. ~/.zsh/aliases
. ~/.zsh/config
. ~/.zsh/functions

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit -u
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.config/zsh/zshrc.local ] && source ~/.config/zsh/zshrc.local

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/sira.sa/.lmstudio/bin"
