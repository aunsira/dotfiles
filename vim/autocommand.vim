" Remove trailing whitespace on ruby write.
autocmd BufWritePre *.rb :%s/\s\+$//e

autocmd FileType ruby command! Rubocop :call system('rubocop -a '.expand('%')) | e

autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4

" Set whitespace character
autocmd InsertEnter * set list listchars=tab:»·,trail:\·,precedes:«,extends:»
autocmd InsertLeave * set list listchars=tab:\ \ ,trail:\·,precedes:«,extends:»
