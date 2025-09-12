function gg --description "Google search from command line"
    set -l search ""
    echo "Googling: $argv"
    for term in $argv
        set search "$search%20$term"
    end
    open "http://www.google.com/search?q=$search"
end