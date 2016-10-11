" Others stuff would be put here
" ==========================================================================

" Disable next line commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Remove trailing whitespace on save for ruby files
autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd WinEnter,FocusGained * :setlocal number relativenumber
autocmd WinLeave,FocusLost   * :setlocal number norelativenumber
