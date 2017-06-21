set statusline=\ %f     " Path to the file
set statusline+=\ %4*%m " Modified flag
set statusline+=%*      " Clear highlight from modified flag
set statusline+=\ %y    " Filetype
set stl+=\ %{fugitive#statusline()} " Git branch name
set statusline+=%=      " Switch to the right side
set statusline+=%l      " current line
set statusline+=/%L     " Total lines

" Disable next line commenting
au FileType * set fo-=c fo-=r fo-=o
