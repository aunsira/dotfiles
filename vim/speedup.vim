" Shortcuts and mapping stuffs that make me speedup
" ====================================================================

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
" Shortcut for typing :Ack
nnoremap <leader>f :Ack<Space>

map <Leader>ne :NERDTreeFind<CR>zz
map <Leader>q :q<CR>
map <Leader>s :w<CR>
map <Leader>x :x<CR>
" Switch buffers easier
map <leader>b :EasyBufferHorizontal<CR>
map <leader>w <C-w>w
vnoremap <leader>y "*y

" Indent lines with cmd+[ and cmd+]
nmap <D-]> >>
nmap <D-[> <<
vmap <C-[> <gv
vmap <C-]> >gv

" Faster viewport scrolling (3 lines at a time)
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
vnoremap <C-e> 3<C-e>
vnoremap <C-y> 3<C-y>

" Tab to next buffer
nnoremap <tab> :bnext<cr>
" Shift-tab to previous buffer
nnoremap <leader><tab> :bprevious<cr>
" Switch between last two buffers
nnoremap <leader>. <C-^>

" Map fzf plugin
nmap <leader>p :FZF<cr>
" Quickly open a second window to view files side by side
nmap <LEADER>vs :vsplit<CR>
" bind K to grep word under cursor
nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Use C-Space to Esc out of any mode (Terminal sees <C-@> as <C-space> WTF, but ok)
nnoremap <C-@> <Esc>:noh<CR>
vnoremap <C-@> <Esc>gV
onoremap <C-@> <Esc>
cnoremap <C-@> <C-c>
inoremap <C-@> <Esc>`^
if has("gui_running")
  " Use C-Space to Esc out of any mode
  nnoremap <C-Space> <Esc>:noh<CR>
  vnoremap <C-Space> <Esc>gV
  onoremap <C-Space> <Esc>
  cnoremap <C-Space> <C-c>
  inoremap <C-Space> <Esc>`^
endif

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
map <leader>gs :Gstatus<cr>
map <leader>gc :Gcommit<cr>
map <leader>gg :Gbrowse<cr>
map <leader>gb :Gblame<cr>
map <leader>gd :Gdiff<cr>

" Make Y act like other capitals
map Y y$

" move by line on the screen rather than by line in the file
nmap k gk
nmap j gj

" Emacs-like beginning and end of line.
imap <c-e> <c-o>$
imap <c-a> <c-o>^

" break this line into a new one below
map <CR> i<CR><Esc>
" add newline above current line
map <Esc><CR> O<Esc>
" add newline below current line
map <Leader><CR> o<Esc>

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
map <Leader>gy :Goyo 140x70<cr>

" Use GV without hit colon
map <Leader>gv :GV<cr>

nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
