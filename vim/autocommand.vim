autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 autoindent
autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd BufEnter PULLREQ_EDITMSG setlocal filetype=gitcommit
autocmd BufEnter PULLREQ_EDITMSG setlocal filetype=gitcommit
autocmd FileType gitcommit,markdown set nonumber
autocmd FileType gitcommit set spell
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

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
  autocmd FileType ruby nnoremap <silent> gd *<C-]>zz
  autocmd FileType ruby map tS :w<cr>:call RunCurrentSpecFile()<CR>
  autocmd FileType ruby map tN :w<cr>:call RunNearestSpec()<CR>
  autocmd FileType ruby map tL :w<cr>:call RunLastSpec()<CR>
  " autocmd FileType ruby map tA :w<cr>:call RunAllSpecs()<CR>

  nnoremap <leader>ts :wa<cr>:TestNearest -strategy=dispatch<cr>
  nnoremap <leader>tf :wa<cr>:TestFile -strategy=dispatch<cr>
  nnoremap <leader>tl :wa<cr>:TestLast -strategy=dispatch<cr>

  " Make ?,!,:s part of words
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?,!
augroup END

augroup go
  autocmd!

  autocmd FileType go nmap <silent> <Leader>v <Plug>(go-def-vertical)
  autocmd FileType go nmap <silent> <Leader>s <Plug>(go-def-split)

  autocmd FileType go nmap <silent> <Leader>x <Plug>(go-doc-vertical)

  autocmd FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)

  autocmd FileType go nmap <silent> <leader>b :<C-u>call <SID>build_go_files()<CR>
  autocmd FileType go nmap tS :wa<cr>:TestFile -strategy=make<cr>
  autocmd FileType go nmap tN :wa<cr>:TestNearest -strategy=make -v<cr>
  autocmd FileType go nmap tL :wa<cr>:TestLast -strategy=make<cr>
  autocmd FileType go nmap <silent> <leader>r  <Plug>(go-run)
  autocmd FileType go nmap <silent> <leader>e  <Plug>(go-install)

  autocmd FileType go nmap <silent> <Leader>c <Plug>(go-coverage-toggle)

  autocmd FileType go nmap <silent> <2-LeftMouse> *<Plug>(go-def)
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

augroup ex
  au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
  au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
  au BufRead,BufNewFile mix.lock set filetype=elixir
augroup END

" Help in new tabs
function! s:helptab()
  if &buftype == 'help'
    wincmd T
    nnoremap <buffer> q :q<cr>
  endif
endfunction
autocmd BufEnter *.txt call s:helptab()

au FileType qf call AdjustWindowHeight(3, 30)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$")+1, a:maxheight]), a:minheight]) . "wincmd _"
endfunction

augroup quickfix
    autocmd!
    autocmd FileType qf setlocal wrap
augroup END


" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

autocmd FileType netrw setl bufhidden=wipe

" vim-after-object
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')

" :GV Default diffs to unfolded
autocmd FileType git set foldlevel=1

command! -bang -nargs=+ -complete=dir Rag call fzf#vim#ag_raw(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Auto fix whitespace  fter write.
autocmd BufWritePre *.rb,*.erb,*.yml,*.yaml,*.go,*.json,*.ex,*.exs :execute 'FixWhitespace'

" Include dot(.) as word chars only in Command-Line mode.
autocmd CmdlineEnter * setlocal iskeyword+=.
autocmd CmdlineLeave * setlocal iskeyword-=.

" Don't fold anything.
autocmd BufWinEnter * set foldlevel=999999

" vim:ft=vim
