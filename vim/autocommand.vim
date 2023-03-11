autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 autoindent
autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd BufEnter PULLREQ_EDITMSG setlocal filetype=gitcommit
autocmd BufEnter PULLREQ_EDITMSG setlocal filetype=gitcommit
autocmd FileType gitcommit,markdown set nonumber
autocmd FileType gitcommit set spell
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

augroup ruby
  autocmd FileType ruby nnoremap <silent> <2-LeftMouse> *<C-]>
  autocmd FileType ruby nnoremap <silent> gd *<C-]>zz
  autocmd FileType ruby map tS :w<cr>:call RunCurrentSpecFile()<CR>
  autocmd FileType ruby map tN :w<cr>:call RunNearestSpec()<CR>
  autocmd FileType ruby map tL :w<cr>:call RunLastSpec()<CR>
  " autocmd FileType ruby map tA :w<cr>:call RunAllSpecs()<CR>

  autocmd FileType ruby nnoremap <leader>bp orequire "pry"; binding.pry<esc>:call Save()<cr>

  nnoremap <leader>ts :wa<cr>:TestNearest -strategy=dispatch<cr>
  nnoremap <leader>tf :wa<cr>:TestFile -strategy=dispatch<cr>
  nnoremap <leader>tl :wa<cr>:TestLast -strategy=dispatch<cr>

  " Make ?,!,:s part of words
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?,!
augroup END

augroup ex
  au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
  au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
  au BufRead,BufNewFile mix.lock set filetype=elixir
  " Make ?,!,:s part of words
  autocmd FileType *.ex,*.exs setlocal iskeyword+=?,!

  autocmd FileType elixir nnoremap <leader>bp orequire IEx; IEx.pry<esc>:call Save()<cr>
  autocmd FileType elixir nnoremap <leader>ts :wa<cr>:TestNearest -strategy=neovim<cr>
  autocmd FileType elixir nnoremap <leader>tf :wa<cr>:TestFile -strategy=neovim<cr>
  autocmd FileType elixir nnoremap <leader>tl :wa<cr>:TestLast -strategy=neovim<cr>
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

" Pull path into system clipboard
command! Path let @* = expand("%")

" vim:ft=vim
