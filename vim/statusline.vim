set statusline=\ %F     " Path to the file
set statusline+=\ %4*%m " Modified flag
set statusline+=%*      " Clear highlight from modified flag
set statusline+=\ %y    " Filetype
set stl+=\ %{FugitiveStatusline()} " Git branch name
set statusline+=%=      " Switch to the right side
set statusline+=%l      " current line
set statusline+=/%L     " Total lines
set statusline+=\ %c    " Column number

" Don't auto-break long lines
autocmd BufNewFile,BufRead * setlocal formatoptions-=t

" vim:ft=vim
