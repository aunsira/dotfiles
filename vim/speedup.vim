" Shortcuts and mapping stuffs that make me speedup
" ====================================================================

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
" Shortcut for typing :Ag
nnoremap <leader>f :Ag<Space>

map <Leader>ne :NERDTreeFind<CR>zz
map <Leader>q :q<CR>
nnoremap <Leader>Q :qa!<cr>
map <Leader>s :w<CR>
map <leader>w <C-w>w

" paste from clipboard
nnoremap <leader>p "*p:w<cr>
vnoremap <leader>p "*p:w<cr>
nnoremap <leader>P "*P:w<cr>
vnoremap <leader>P "*P:w<cr>
" yank to clipboard
vnoremap <leader>y "*y
vnoremap <leader>d "*d

" Remap jump to definition for ctags
nmap <leader>] <C-]>
nmap <leader>g] g<C-]>

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

" Use actually useful arrow keys
map <up> :bn<cr>
map <down> :bp<cr>
map <right> :tabn<cr>
map <left> :tabp<cr>

" New tab
nnoremap <leader>t :tabe<cr>

" Map fzf plugin
nmap <C-p> :FZF<cr>
" Quickly open a second window to view files side by side
nmap <LEADER>vs :vsplit<CR>

" bind K to grep word under cursor
nnoremap K :Ag <C-R><C-W><CR>
" bind K to grep word from visual selection
vnoremap K y:Ag <C-R>"<CR>
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
map <leader>gp :Gpush<cr>
map <leader>opr :OpenGithubPullReq<cr>
map <leader>of :OpenGithubFile<cr>

" Make Y act like other capitals
map Y yg_
map <leader>Y vg_"*y

" move by line on the screen rather than by line in the file
nmap k gk
nmap j gj
noremap H ^
noremap L g_

" Some sign that hard to type to
imap uu _
imap hh =>
imap vv <Bar>

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

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Auto center with these motions
noremap n nzz
noremap N Nzz
noremap G Gzz
noremap } }zz
noremap { {zz

" map goyo
map <Leader>G :Goyo 140x70<cr>

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
nnoremap <leader>d :bd<CR>

map <Leader>l :ls<CR>:buffer<Space>

" Replace all
map <Leader>ra :%s/

" Git push stash code
map <Leader>gw :!git add . && git commit -m 'WIP' && git push<cr>

" Quickly open recently files
nmap <leader>ap :e config/application.yml<cr>
map <Leader>sc :sp db/schema.rb<cr>
nmap <leader>mp :e ~/code/git/dotfiles/vim/speedup.vim<cr>

" map <Leader>t :w<cr>:call RunCurrentSpecFile()<CR>

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

nnoremap <leader>bb :Buffers<cr>
nmap Bb :Buffers<cr>
nmap <F1> :Buffers<cr>

nmap <leader>ba :bufdo bd<cr>

" Add binding.
map <Leader>bd orequire 'pry'<cr>binding.pry<esc>:w<cr>
" Add console.log
map <Leader>cl oconsole.log();<Left><Left>

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

" Alternative way for fugutive
nnoremap <silent> Ub             :Gblame<cr>
nnoremap <silent> Ud :if &diff<bar>diffupdate<bar>else<bar>Gdiff<bar>endif<cr>
nnoremap <silent> Ue             :Gedit<cr>
nnoremap          Uf             :Gcommit --fixup=
nnoremap <silent> Ugf            :Gedit <C-R><C-W><cr>
nnoremap <silent> Ul :GV! -100<cr>
nnoremap <silent> Ur             :Gread<cr>
nnoremap <silent> Us             :Gstatus<cr>
nnoremap <silent> Uw :if !exists(":Gwrite")<bar>call fugitive#detect(expand('%:p'))<bar>endif<bar>Gwrite<bar>SignifyRefresh<cr>
nnoremap <silent> Upr            :OpenGithubPullReq<cr>
nnoremap <silent> Um             :OpenGithubFile<cr>

nmap UB Ub
nmap UD Ud
nmap UE Ue
nmap UF Uf
nmap UL Ul
nmap UR Ur
map US Usgg<c-n>
nmap UW Uw
nmap UPR Upr
nmap UM Um

" Split window mappings
nnoremap Zh     :leftabove vsplit<CR>
nnoremap Zj     :belowright split<CR>
nnoremap Zk     :aboveleft split<CR>
nnoremap Zl     :rightbelow vsplit<CR>
nmap     ZH     Zh
nmap     ZJ     Zj
nmap     ZK     Zk
nmap     ZL     Zl

" do not clobber '[ '] on :write
function! s:save_change_marks() abort
  let s:change_marks = [getpos("'["), getpos("']")]
endfunction
function! s:restore_change_marks() abort
  call setpos("'[", s:change_marks[0])
  call setpos("']", s:change_marks[1])
endfunction
nnoremap z. :call <SID>save_change_marks()<Bar>w<Bar>call <SID>restore_change_marks()<cr>

" Mark position before search, use `u to go back to last position
nnoremap / mu/

" ----------------------------------------------------------------------------
" <Leader>?/! | Google it / Feeling lucky
" ----------------------------------------------------------------------------
function! s:goog(pat, lucky)
  let q = '"'.substitute(a:pat, '["\n]', ' ', 'g').'"'
  let q = substitute(q, '[[:punct:] ]',
       \ '\=printf("%%%02X", char2nr(submatch(0)))', 'g')
  call system(printf('open "https://www.google.com/search?%sq=%s"',
                   \ a:lucky ? 'btnI&' : '', q))
endfunction

nnoremap <leader>? :call <SID>goog(expand("<cWORD>"), 0)<cr>
nnoremap <leader>! :call <SID>goog(expand("<cWORD>"), 1)<cr>
xnoremap <leader>? "gy:call <SID>goog(@g, 0)<cr>gv
xnoremap <leader>! "gy:call <SID>goog(@g, 1)<cr>gv

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

" remove trailing whitespaces
nmap <silent> <leader>rw <ESC>:%s/\s\+$//<CR>

nnoremap Q @q

" Places the current match at the center of the window.
noremap <plug>(slash-after) zz

" Re tag
nnoremap <leader>rt :!ctags -R --exclude=.svn --exclude=.git --exclude=log --exclude=tmp *<cr>
