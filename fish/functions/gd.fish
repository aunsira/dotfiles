function gd --description "Git diff with pager"
    if test (count $argv) -gt 0
        git diff $argv | less -R
    else
        git diff | less -R
    end
end