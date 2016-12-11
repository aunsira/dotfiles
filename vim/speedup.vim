" Shortcuts and mapping stuffs that make me speedup
" ====================================================================

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
" Shortcut for typing :CtrlSF
nnoremap <leader>f :CtrlSF<Space>

map <Leader>ne :NERDTreeFind<CR>zz
map <Leader>q :q<CR>
map <Leader>s :w<CR>
map <leader>w <C-w>w

" paste from clipboard
nnoremap <leader>p "*p:w<cr>
vnoremap <leader>p "*p:w<cr>
nnoremap <leader>P "*P:w<cr>
vnoremap <leader>P "*P:w<cr>
" yank to clipboard
vnoremap <leader>y "*y

" Indent lines with ctrl+[ and ctrl+]
nmap <C-]> >>
nmap <C-[> <<
vmap <C-[> <gv
vmap <C-]> >gv

" Faster viewport scrolling (3 lines at a time)
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
vnoremap <C-e> 3<C-e>
vnoremap <C-y> 3<C-y>

" To next buffer
nnoremap ]b :bnext<cr>
" To previous buffer
nnoremap [b :bprev<cr>
" Switch between last two buffers
nnoremap <leader><tab> <C-^>

nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>

" Map fzf plugin
nmap <C-p> :FZF<cr>
" Quickly open a second window to view files side by side
nmap <LEADER>vs :vsplit<CR>

" bind K to grep word under cursor
nnoremap K :CtrlSF <C-R><C-W><CR>:cw<CR>
" bind K to grep word from visual selection
vnoremap K y:CtrlSF '<C-r>"'<C-b><CR>
" normal search on visual selection
vnoremap // y/<C-R>"<CR>

" Use C-Space to Esc out of any mode (Terminal sees <C-@> as <C-space> WTF, but ok)
nnoremap <C-@> <Esc>:noh<CR>
vnoremap <C-@> <Esc>gV
onoremap <C-@> <Esc>
cnoremap <C-@> <C-c>
inoremap <C-@> <Esc>`^
" For GUI
nnoremap <C-Space> <Esc>:noh<CR>
vnoremap <C-Space> <Esc>gV
onoremap <C-Space> <Esc>
cnoremap <C-Space> <C-c>
inoremap <C-Space> <Esc>`^

" Go to position of last edit. Mnem: 'Go to Edit'
nnoremap ge `.
" Leader-; to enter command mode. No more holding shift!
nnoremap <leader>; :
vnoremap <leader>; :

" Easy access to the start of the line
nnoremap 0 ^
" Window resizing
noremap <leader>= <C-w>=

" Git shortcuts
map <leader>gs :Gstatus<cr>gg<c-n>
map <leader>gc :Gcommit<cr>
map <leader>gg :Gbrowse<cr>
map <leader>gb :Gblame<cr>
map <leader>gd :Gdiff<cr>
map <leader>gr :Gread<cr>:w<cr>
map <leader>opr :OpenGithubPullReq<cr>
map <leader>of :OpenGithubFile<cr>

" Make Y act like other capitals
map Y y$

" move by line on the screen rather than by line in the file
nmap k gk
nmap j gj
noremap H ^
noremap L $

" Emacs-like beginning and end of line.
imap <c-e> <c-o>$
imap <c-a> <c-o>^

" break this line into a new one below
map <CR> i<CR><Esc>
" add newline above current line
map <Esc><CR> O<Esc>
" add newline below current line
map <Leader><CR> o<Esc>

" Reindent file.
map <Leader>i mmgg=G`m

function! CurrenRelativeDirectory()
  let relative_dir = substitute(expand("%:p:h"), getcwd()."/", "", "")."/"
  return escape(relative_dir, " ")
endfunction

" Easy navigation for editing and coding
nnoremap <leader>rr :r <C-r>=CurrenRelativeDirectory()<cr>
nnoremap <leader>er :e <C-r>=escape(expand("%:p:h"), ' ')<cr>/
nnoremap <Leader>es :e ~/code/git/skilllane-web/ClassroomApp/
nnoremap <Leader>eg :e ~/code/git/
nnoremap <Leader>eh :e ~/
nnoremap <Leader>cd :cd ~/
nnoremap <Leader>cs :cd ~/code/git/skilllane-web/ClassroomApp/
nnoremap <Leader>cg :cd ~/code/git/

" Shortcut for Tabularize
map <Leader>a :Tabularize /

" Next search will be at the middle screen
noremap n nzz

" map goyo
map <Leader>G :Goyo 140x70<cr>

" Use GV without hit colon
map <Leader>gv :GV<cr>

nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

" vim-commentary
map  gc  <Plug>Commentary
nmap gcc <Plug>CommentaryLine

" Use Easymotion instead of normal vim search
map <Leader>/ <Plug>(easymotion-sn)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Kill buffer with leader + d
map <leader>d :bd<CR>

map <Leader>l :ls<CR>:buffer<Space>

" Replace all
map <Leader>ra :%s/

" Git push stash code
map <Leader>gw :!git add . && git commit -m 'WIP' && git push<cr>

" Quickly open recently files
nmap <leader>ap :e config/application.yml<cr>
map <Leader>sc :sp db/schema.rb<cr>
nmap <leader>mp :e ~/code/git/dotfiles/vim/speedup.vim<cr>

map <Leader>t :w<cr>:call RunCurrentSpecFile()<CR>

" Markdown Underlines
function! UnderlineHeading(level)
  if a:level == 1
    normal! yypVr=
  elseif a:level == 2
    normal! yypVr-
  else
    normal! I###<space>
  endif
endfunction

nnoremap <leader>u1 :call UnderlineHeading(1);
nnoremap <leader>u2 :call UnderlineHeading(2);
nnoremap <leader>u3 :call UnderlineHeading(3);

nnoremap <leader>be :EasyBufferHorizontal<cr>

" Add binding.
map <Leader>bd orequire 'pry'<cr>binding.pry<esc>:w<cr>

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <Leader>rn :call RenameFile()<cr>

" Jump list (to newer position)
nnoremap <C-t> <C-i>

map <leader>sop :source ~/.config/nvim/init.vim<cr>:PlugInstall<cr>
