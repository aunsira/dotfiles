function g --description "Git shorthand - shows status if no args, otherwise runs git command"
    if test (count $argv) -gt 0
        git $argv
    else
        git status
    end
end
