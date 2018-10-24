" Shortcut for typing :Ag
nnoremap <leader>f :Ag!<Space>

" Write/Exit shortcuts
inoremap <C-s> <esc>:call Save()<cr>
nnoremap <C-s> <esc>:call Save()<cr>
inoremap <C-c> <esc>
map <Leader>q :copen<cr>
map <C-x> <C-w>c
nnoremap <Leader>Q :qa!<cr>

" Circular windows navigation
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" paste from clipboard
nnoremap <leader>p "*p<cr>
vnoremap <leader>p "*p<cr>
nnoremap <leader>P "*P<cr>
vnoremap <leader>P "*P<cr>
" yank to clipboard
vnoremap <leader>y "*y
vnoremap <leader>d "*d
map <leader>x y

" Remap jump to definition for ctags
nmap <leader>] <C-]>zz
nmap <leader>g] g<C-]>zz

" Faster viewport scrolling (10 lines at a time)
nnoremap <C-e> 10<C-e>
nnoremap <C-y> 10<C-y>
vnoremap <C-e> 10<C-e>
vnoremap <C-y> 10<C-y>

" To next buffer
nnoremap ]b :bnext<cr>
" To previous buffer
nnoremap [b :bprev<cr>
" Switch between last two buffers
nnoremap <leader><tab> <C-^>

" Tab navigation
nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>

" Use actually useful arrow keys
nnoremap <Left> :vertical resize +1<CR>
nnoremap <Right> :vertical resize -1<CR>
nnoremap <Up> :resize +1<CR>
nnoremap <Down> :resize -1<CR>

" New tab
nnoremap <leader>tn :tabe<cr>

" Map fzf plugin
nnoremap <silent> <C-p> :Files<cr>
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-l> <plug>(fzf-complete-line)
imap <c-x><c-f> <plug>(fzf-complete-path)
nnoremap <leader>l :Lines<cr>
nnoremap <enter> :Buffers<cr>
nnoremap <silent> <Leader>` :Marks<CR>
nnoremap <leader>ca :Files app/<cr>
nnoremap <leader>cm :Files app/models/<cr>
nnoremap <leader>cc :Files app/controllers/<cr>
nnoremap <leader>cp :Files spec/<cr>

" Quickly open a second window to view files side by side
nmap <LEADER>vs :vsplit<CR>

" bind K to grep word under cursor
nnoremap K :Ag! <C-R><C-W><CR>
nnoremap <M-Tab> :Ag! <C-R><C-W><CR>
" bind K to grep word from visual selection
vnoremap K y:Ag! <C-R>"<CR>
" normal search on visual selection
vnoremap // y/<C-R>"<CR>

" Use C-Space to Esc out of any mode (Terminal sees <C-@> as <C-space> WTF, but ok)
nnoremap <C-@> <Esc>:noh<cr>
vnoremap <C-@> <Esc>gV
onoremap <C-@> <Esc>
cnoremap <C-@> <C-c>
inoremap <C-@> <Esc>`^
" For GUI
nnoremap <C-Space> <Esc>:noh<cr>
vnoremap <C-Space> <Esc>gV
onoremap <C-Space> <Esc>
cnoremap <C-Space> <C-c>
inoremap <C-Space> <Esc>`^

" Go to position of last edit(`.) and recenter. Mnem: 'Go to Edit'
nnoremap ge `.zz
" Leader-; to enter command mode. No more holding shift!
nnoremap <leader>; :
vnoremap <leader>; :
nnoremap <leader><leader> :
vnoremap <leader><leader> :

" Git shortcuts
map <leader>gs :Gstatus<cr>gg<c-n>
map <leader>gc :Gcommit<cr>
map <leader>gg :Gbrowse<cr>
map <leader>gb :Gblame<cr>
map <leader>gd :Gdiff<cr>
map <leader>gp :Gpush<cr>
map <leader>gr :Gread<cr>

" Make Y act like other capitals
map Y yg_
map <leader>Y vg_"*y

" move by line on the screen rather than by line in the file
nnoremap k gk
nnoremap j gj

nnoremap gj 5j
nnoremap gk 5k
vnoremap gk 5k
vnoremap gj 5j

" Emacs-like beginning and end of line.
inoremap <silent> <c-e> <esc>A
inoremap <silent> <c-a> <esc>I
noremap H ^
noremap L g_

" add newline below current line
map z<CR> o<Esc>
map Z<CR> O<Esc>

" Reindent file.
map <Leader>i mmgg=G`m

" File opening
cnoremap <expr> %%  getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '%%'

" Easy navigation for editing and coding
nnoremap <leader>er :e <C-r>=escape(expand("%:p:h"), ' ')<cr>/
nnoremap <Leader>eg :e ~/code/git/
nnoremap <Leader>eh :e ~/
nnoremap <Leader>cd :cd <C-r>=escape(expand("%:p:h"), ' ')<cr>/
nnoremap <Leader>cg :cd ~/code/git/
nnoremap <leader>ed :e ~/Dropbox/notes/datawow-notes.txt<cr>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Shortcut for replacing
map <Leader>ra :%S/

" Auto center with these motions
noremap n nzz
noremap N Nzz
noremap G Gzz
noremap } }zz
noremap { {zz
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz

" Use GV without hit colon
map <Leader>gv :GV<cr>

nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

" vim-commentary
map  gc  <Plug>Commentary
nmap gcc <Plug>CommentaryLine
map <leader>\ <Plug>CommentaryLine
vmap <leader>\ <Plug>Commentary

" Use Easymotion instead of normal vim search
map <Leader>/ <Plug>(easymotion-sn)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Kill buffer with leader + d
nnoremap <leader>d :bd!<CR>

" Git push stash code
map <Leader>gw :!git add . && git commit -m 'WIP' && git push<cr>

" Quickly open recently files
map <Leader>sc :sp db/schema.rb<cr>
nmap <leader>mp :e ~/code/git/dotfiles/vim/speedup.vim<cr>

nnoremap <leader>u1 :call UnderlineHeading(1);
nnoremap <leader>u2 :call UnderlineHeading(2);
nnoremap <leader>u3 :call UnderlineHeading(3);

nmap <leader>ba :bufdo bd<cr>

" Add binding.
nnoremap <leader>bd orequire "pry"; binding.pry<esc>

map <Leader>rn :call RenameFile()<cr>

" Jump list (to newer position)
nnoremap <C-t> <C-i>zz
nnoremap <C-o> <C-o>zz

" Reload configuration file
map <leader>sop :source ~/.config/nvim/init.vim<cr>

" Split window mappings
nnoremap Zh     :leftabove vsplit<CR>
nnoremap Zj     :belowright split<CR>
nnoremap Zk     :aboveleft split<CR>
nnoremap Zl     :rightbelow vsplit<CR>
nmap     ZH     Zh
nmap     ZJ     Zj
nmap     ZK     Zk
nmap     ZL     Zl
nmap     ZT     :tabclose<cr>

nnoremap z. :call Save()<CR>

" Mark position before search, use `u to go back to last position
nnoremap / mu/

" Google from selection
nnoremap <leader>? :call Goog(expand("<cWORD>"), 0)<cr>
nnoremap <leader>! :call Goog(expand("<cWORD>"), 1)<cr>
xnoremap <leader>? "gy:call Goog(@g, 0)<cr>gv
xnoremap <leader>! "gy:call Goog(@g, 1)<cr>gv

onoremap p i(
onoremap ' i'
onoremap " i"
vnoremap <leader>' <esc>a'<esc>`<i'<esc>`>el
vnoremap <leader>" <esc>a"<esc>`<i"<esc>`>el
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" Map Ctrl+V to paste in Insert mode
imap <C-V> <C-R>*

" Map Ctrl+C to copy in Visual mode
vmap <C-C> "+y

nnoremap Q @q

noremap <F5> :NumberToggle<cr>

command! Q q " Bind :Q to :q
command! Qall qall
command! QA qall
command! E e
command! W w
command! Wq wq

" vim-move
nmap zj <Plug>MoveLineDown
nmap zk <Plug>MoveLineUp
vmap zj <plug>MoveBlockDown
vmap zk <plug>MoveBlockUp

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>a
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
" Movement in command mode
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>

" Search in project, but open at bottom of screen.
" command! -bang -nargs=* Ag
"   \ call fzf#vim#ag(<q-args>, '--color-path 400 --color-line-number 400', fzf#vim#with_preview())

" as well as above, but open in full screen.
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \ <bang>0 ? fzf#vim#with_preview('up:60%')
  \         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \ <bang>0)

" Search file and also show preview.
" command! -bang -nargs=? -complete=dir Files
"   \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" as well as above, but open in full screen.
" command! -bang -nargs=? -complete=dir Files
"   \ call fzf#vim#files(<q-args>,
"   \                 <bang>0 ? fzf#vim#with_preview('up:60%')
"   \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
"   \                 <bang>0)

" Test file
nnoremap <leader>tf :TestFile<cr>
nnoremap <leader>ts :TestNearest<cr>
nnoremap <leader>tl :TestLast<cr>

" Quick fix lint
nmap zn :ALEFix<cr>

" quickfix list
nnoremap ]q :cnext<cr>
nnoremap [q :cprevious<cr>
nnoremap ]Q :clast<cr>
nnoremap [Q :cfirst<cr>

" loclist
nnoremap ]l :lnext<cr>
nnoremap [l :lprevious<cr>
nnoremap ]L :llast<cr>
nnoremap [L :lfirst<cr>

" Close quickfix/location window
nnoremap <leader>cs :cclose<bar>lclose<bar>VtrKillRunner<cr>

" ale errors
nmap ]w <plug>(ale_next)
nmap [w <plug>(ale_previous)
nmap ]W <plug>(ale_first)
nmap ]W <plug>(ale_last)

" Golang stuff
nmap <C-g> :GoDecls<cr>
imap <C-g> <esc>:<C-u>GoDecls<cr>

" Go to marked
nnoremap gm `u

" Highlight current word without move to the next
nnoremap * *Nzz

imap uu _
cnoremap uu _

nnoremap <silent> <leader>rd :redraw!<cr>

" Tmux-runner
map <leader>sl :VtrSendLinesToRunner<cr>
nnoremap <leader>ap :VtrAttachToPane<cr>
nnoremap <leader>rr :VtrFocusRunner<cr>

nnoremap <leader>- :Switch<cr>

nnoremap <leader>lc q:k<C-c>

" Reduce finger movements
nmap t' vi'"0p
nmap t" vi""0p
nmap t[ vi]"0p
nmap t( vi)"0p
nmap t{ vi}"0p
nmap tw viw"0p

nmap yw yiw
nmap y' yi'
nmap y" yi"
nmap y[ yi[
nmap y( yi(
nmap y{ yi{

nmap vw viw
nmap v' vi'
nmap v" vi"
nmap v[ vi[
nmap v( vi(
nmap v{ vi{

nmap cw ciw
nmap c' ci'
nmap c" ci"
nmap c[ ci[
nmap c( ci(
nmap c{ ci{

nmap d' di'
nmap d" di"
nmap d[ di[
nmap d( di(
nmap d{ di{

" vim:ft=vim
