" Remove trailing whitespace on ruby write.
autocmd BufWritePre *.rb :%s/\s\+$//e

" Redefine :Ag command
autocmd VimEnter * command! -nargs=* Ag
      \ call fzf#vim#ag(<q-args>, '--color-path 400 --color-line-number 400', fzf#vim#default_layout)

autocmd FileType ruby command! Rubocop :call system('rubocop -a '.expand('%')) | e

autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4

" Set whitespace character
autocmd InsertEnter * set list listchars=tab:»·,trail:\·,precedes:«,extends:»
autocmd InsertLeave * set list listchars=tab:\ \ ,trail:\·,precedes:«,extends:»
