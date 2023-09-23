" Shortcut for typing :Ag
nnoremap <leader>ag :Ag!<Space>
nnoremap <leader><BS> :Ag!<Space>
" Search in specific module
nnoremap <leader>rg :Rag!<Space>

" Automatically jump to end of text you pasted:
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Go back to last pasted after visual indent
vnoremap <silent> = =`]

" Make navigating around splits easier
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Write/Exit shortcuts
inoremap <C-s> <esc>:update<cr>
nnoremap <C-s> <esc>:update<cr>
inoremap <C-c> <esc>`^
nnoremap <C-c> <esc>
vnoremap <C-c> <esc>
map <Leader>q :copen<cr><tab>
map <C-x> <C-w>c
nnoremap <silent><Leader>w <esc>:call Save()<cr>
" nnoremap <silent><Leader>q :q!<cr>
nnoremap <Leader>Q :qa!<cr>
noremap <Leader>wq :wq<cr>

" Circular windows navigation
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" paste from clipboard
nnoremap <leader>p "*p<cr>
vnoremap <leader>p "*p<cr>
nnoremap <leader>P "*P<cr>
vnoremap <leader>P "*P<cr>
" Replacing from clipboard register with following commands, e.g. <leader>griw => to replace in a word
nmap <leader>gr "*gr

" yank to clipboard
vnoremap <leader>y "*y
vnoremap <leader>d "*d

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
nmap ]t :tabn<cr>
nmap [t :tabp<cr>

" Project browsing
"
" Karabiner complex modifications rules - Map Option to soft-meta for Alacritty is required.
nmap <Esc><Space> :e<space>
nmap <Esc><Enter> :b<space>

" Map fzf plugin
nnoremap <silent> <C-p> :Files<cr>
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
nnoremap <leader>L :Lines<cr>
nnoremap <enter> :Buffers<cr>

" bind K to grep word under cursor
nnoremap K :Ag! <C-R><C-W><CR>
nnoremap B :Ag! <C-R><C-W><CR>!test<Space>
nnoremap <M-Tab> :Ag! <C-R><C-W><CR>
" bind K to grep word from visual selection
vnoremap K y:Ag! <C-R>"<CR>
vnoremap B y:Ag! <C-R>"<CR>!test<Space>
vnoremap <leader><BS> y:Ag! <C-R>"<CR>
" normal search on visual selection
vnoremap // y/<C-R>"<CR>

" Use C-Space to Esc out of any mode
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

" Git shortcuts
nmap  <silent> \<space> :ToggleGstatus<cr>
nnoremap \p :Git push<cr>
nnoremap \b :Git blame<cr>
nnoremap <silent> \<tab> :Gdiffsplit<cr>

" Make Y act like other capitals
map Y yg_
map <leader>Y vg_"*y

" move by line on the screen rather than by line in the file
nnoremap k gk
nnoremap j gj

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
nnoremap <leader>er :e <C-r>=fnameescape(expand('%:h')).'/'<cr>
nnoremap <Leader>eg :e ~/code/git/
nnoremap <Leader>eh :e ~/
nnoremap <Leader>cd :cd <C-r>=escape(expand("%:p:h"), ' ')<cr>/
nnoremap <Leader>cg :cd ~/code/git/
nnoremap <leader>ed :Files ~/Library/CloudStorage/Dropbox/notes<cr>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
command! ReformatTable normal vip<cr>**|
vmap <cr> <Plug>(EasyAlign)

" Shortcut for replacing
nnoremap <leader>sub :%s//
vnoremap <leader>sub :s//
map <leader>ra :%S/<c-r><c-w>/<c-r><c-w><c-w>

" Use Easymotion instead of normal vim search
map <Leader>/ <Plug>(easymotion-sn)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <C-_> <Plug>(easymotion-sn)

" Kill buffer with leader + bd and keep the window presents
nnoremap <leader>bw :bp\|bd #<CR>

" Git push stash code
map <Leader>gw :!git add . && git commit -m 'WIP' && git push<cr>

" hub
map <leader>hb :!hub browse<cr>
map <leader>hc :!hub compare<cr>
map <leader>hps :!hub pr show<cr>

nnoremap <leader>u1 m`^i# <esc>``2l
nnoremap <leader>u2 m`^i## <esc>``3l
nnoremap <leader>u3 m`^i### <esc>``4l
nnoremap <leader>u4 m`^i#### <esc>``5l
nnoremap <leader>u5 m`^i##### <esc>``6l
nnoremap <leader>u9 :norm 90i=<esc><cr>

nmap <leader>ba :bufdo bd<cr>

map <Leader>rn :call RenameFile()<cr>

" Jump list (to newer position)
nnoremap <C-t> <C-i>zz
nnoremap <C-o> <C-o>zz

" Reload configuration file
map <leader>sop :source ~/.config/nvim/init.vim<cr>

nnoremap z. :call Save()<CR>

" Mark position before search, use `u to go back to last position
nnoremap / mu/

" Google from selection
nnoremap <leader>? :call Goog(expand("<cWORD>"), 0)<cr>
nnoremap <leader>! :call Goog(expand("<cWORD>"), 1)<cr>
xnoremap <leader>? "gy:call Goog(@g, 0)<cr>gv
xnoremap <leader>! "gy:call Goog(@g, 1)<cr>gv

" Map Ctrl+V to paste in Insert mode
imap <C-V> <C-R>*

" Execute macro in q
nnoremap Q @q

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

" Movement in command mode
cnoremap <c-a> <C-b>

" Stay in search mode in Vim by using Ctrl-g and Ctrl-t after searching for a pattern
" https://vimtricks.com/p/vimtrick-stay-in-search-mode/
cnoremap <c-s> <c-t>
cnoremap <c-t> <c-g>

" Move line in insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi

" Search in project, but open at bottom of screen.
" command! -bang -nargs=* Ag
"   \ call fzf#vim#ag(<q-args>, '', fzf#vim#with_preview('right:55%', '?'))

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

command! -bang -nargs=+ -complete=dir Rag call fzf#vim#ag_raw(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

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
nnoremap <leader>cc :cc<cr>

" Go to marked
nnoremap gm `u

" Highlight current word without move to the next.
" Also mark position before search by using 'mu' and `u or gm to go back to last position.
nnoremap <silent> * mu:let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>zz
nnoremap <silent> <C-n> mu:let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>zz
vmap <C-n> *Nmu

" Tmux-runner
map <leader>sl :VtrSendLinesToRunner<cr>
nnoremap <leader>ap :VtrAttachToPane<cr>
nnoremap <leader>rr :VtrFocusRunner<cr>

nnoremap <leader>- :Switch<cr>

nnoremap <leader>lc q:k<C-c>

" Paste in line from vim-system-copy
nmap cvl cvil
" Remap default copy key from vim-system-copy
nmap cy <Plug>SystemCopy
xmap cy <Plug>SystemCopy

" vim-textobj-quotes eg. ciq, diq, viq, yiq, tiq
xmap q iq
omap q iq

xmap w iw
omap w iw

" Easier to reach % for matching block/bracket
nmap <C-b> %
xmap b i%
omap b i%

" Insert current time
inoremap <silent> <C-G><C-T> <C-R>=repeat(complete(col('.'),map(["%Y-%m-%d %H:%M:%S","%a, %d %b %Y %H:%M:%S %z","%Y %b %d","%d-%b-%y","%a %b %d %T %Z %Y"],'strftime(v:val)')+[localtime()]),0)<CR>

" Close all but the current one
nnoremap <leader>o :only<CR>zz

" mimic the behavior of /%Vfoobar which searches within the previously
" selected visual selection
" while in search mode, pressing / will do this
vnoremap / <Esc>/\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l
vnoremap ? <Esc>?\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l

" Stay in visual after indenting
vnoremap < <gv
vnoremap > >gv
vnoremap <silent> <C-h> <gv
vnoremap <silent> <C-l> >gv

nnoremap <leader><leader> :
vnoremap <leader><leader> :
nnoremap <leader>, :!

" Keymap for creating todo list.
nnoremap [z I[ ]<Space><Esc>
nnoremap [x I[x]<Space><Esc>

" easier to reach context completion
inoremap <c-x><c-u> <c-x><c-p>

" tags
nnoremap <c-]> g<c-]>zz

" tab navigation (with leader + number)
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt

" reselect pasted text
nnoremap gp `[v`]

" tyru/open-browser.vim
nmap gx <Plug>(openbrowser-open)
vmap gx <Plug>(openbrowser-open)

" Dash integration
nmap <silent> M <Plug>DashSearch

" C-BS to word deletion
inoremap <M-BS> <C-W>
cnoremap <M-BS> <C-W>

" Insert a pipe with ctrl-l
imap <c-l> \|><space>

" Switch to normal mode in terminal window by ctrl-o
tmap <C-o> <C-\><C-n>

" nvim-snippy
imap <expr> <C-]> snippy#can_expand_or_advance() ? '<Plug>(snippy-expand-or-advance)' : '<C-]>'

" GitHub Copilot
imap <silent><script><expr> <C-E> copilot#Accept("<End>")

" vim:ft=vim
