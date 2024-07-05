autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 autoindent
autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd BufEnter PULLREQ_EDITMSG setlocal filetype=gitcommit
autocmd BufEnter PULLREQ_EDITMSG setlocal filetype=gitcommit
autocmd FileType gitcommit,markdown setlocal nonumber wrap linebreak nolist
autocmd FileType gitcommit setlocal spell
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

augroup ruby
  autocmd FileType ruby nnoremap <silent> <2-LeftMouse> *<C-]>
  autocmd FileType ruby nnoremap <silent> gd *<C-]>zz

  " Make ?,!,:s part of words
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?,!
augroup END

augroup ex
  au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
  au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
  au BufRead,BufNewFile mix.lock set filetype=elixir
  " Make ?,!,:s part of words
  autocmd FileType *.ex,*.exs setlocal iskeyword+=?,!
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
    autocmd FileType qf setlocal wrap linebreak nolist
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

" Pull path into system clipboard
command! Path let @* = expand("%")

" Automatically resize all vim buffers if terminal window has been resized.
autocmd VimResized * wincmd =

" Don't automatically continue comments after newline
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Switch test strategy
command! TestDispatch let test#strategy = "dispatch" | echo "vim-test: switched to dispatch strategy"
command! TestMakeBang let test#strategy = "make_bang" | echo "vim-test: switched to make_bang strategy"

" vim:ft=vim
