function rgrep --description "Interactive fuzzy search with ripgrep and fzf"
    set -l reload 'reload:rg --column --color=always --smart-case {q} || :'
    set -l opener 'if test $FZF_SELECT_COUNT -eq 0
                       "$EDITOR" {1} +{2}
                   else if test "$EDITOR" = vim -o "$EDITOR" = nvim
                       "$EDITOR" +cw -q {+f}
                   else
                       "$EDITOR" {+1}
                   end'
    
    fzf --no-height --tmux 100% --disabled --ansi --multi --query "$argv" \
        --bind "start,change:$reload" \
        --bind "enter:become:$opener" \
        --bind "ctrl-o:execute:$opener" \
        --bind 'alt-a:select-all,alt-d:deselect-all,ctrl-/:toggle-preview' \
        --delimiter : \
        --preview-window 'up,border-bottom,~3,+{2}+3/3'
end