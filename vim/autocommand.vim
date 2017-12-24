" Remove trailing whitespace on ruby write.
autocmd BufWritePre *.rb :%s/\s\+$//e

autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType gitcommit,markdown set nonumber
autocmd FileType gitcommit,markdown set spell

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

augroup ruby
  autocmd FileType ruby nnoremap <silent> <2-LeftMouse> *<C-]>
augroup END

augroup go
  autocmd!

  autocmd FileType go nmap <silent> <Leader>v <Plug>(go-def-vertical)
  autocmd FileType go nmap <silent> <Leader>s <Plug>(go-def-split)

  autocmd FileType go nmap <silent> <Leader>x <Plug>(go-doc-vertical)

  autocmd FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)

  autocmd FileType go nmap <silent> <leader>b :<C-u>call <SID>build_go_files()<CR>
  autocmd FileType go nmap <silent> <leader>t  <Plug>(go-test)
  autocmd FileType go nmap <silent> <leader>r  <Plug>(go-run)
  autocmd FileType go nmap <silent> <leader>e  <Plug>(go-install)

  autocmd FileType go nmap <silent> <Leader>c <Plug>(go-coverage-toggle)

  autocmd FileType go nmap <silent> <2-LeftMouse> *<Plug>(go-def)

  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

augroup js
  autocmd!
  autocmd FileType javascript inoremap <silent> <M-r> =><space>
  autocmd FileType javascript inoremap <silent> <M-t> return<space>
  autocmd FileType javascript inoremap <silent> <M-f> function<space>
  autocmd FileType javascript inoremap <silent> <M-q> require('');<left><left><left>
  autocmd FileType javascript nnoremap <silent> <M-a> A;<esc>
  autocmd FileType javascript nnoremap <silent> <leader>cl oconsole.log();<Left><Left>
  autocmd FileType javascript inoremap <silent> <M-c> console.log();<Left><Left>
  autocmd FileType javascript nnoremap <silent> <2-LeftMouse> *:TernDef<cr>
augroup END

" Help in new tabs
function! s:helptab()
  if &buftype == 'help'
    wincmd T
    nnoremap <buffer> q :q<cr>
  endif
endfunction
autocmd BufEnter *.txt call s:helptab()

autocmd FileType go,javascript,ruby nnoremap <silent> <Leader>z <C-o>zz

" vim:ft=vim
