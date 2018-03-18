" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
map <Leader>ne :NERDTreeFind<CR>zz

" Shortcut for typing :Ag
nnoremap <leader>f :Ag!<Space>

" Write/Exit shortcuts
inoremap <C-s> <esc>:update<cr>
nnoremap <C-s> <esc>:update<cr>
inoremap <C-c> <esc>
map <Leader>q :copen<cr>
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
nnoremap <silent> <expr> <C-p> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
imap <c-x><c-k> <plug>(fzf-complete-word)
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
map <leader>opr :OpenGithubPullReq<cr>
map <leader>of :OpenGithubFile<cr>

map <M-s> :Gstatus<cr>gg<c-n>
map <M-d> :Gdiff<cr>
map <M-b> :Gblame<cr>
map <M-p> :Gpush<cr>
map <M-r> :Gread<cr>:w<cr>

" Make Y act like other capitals
map Y yg_
map <leader>Y vg_"*y

" move by line on the screen rather than by line in the file
nmap k gk
nmap j gj

" Emacs-like beginning and end of line.
imap <c-e> <esc>A
imap <c-a> <esc>I
noremap H ^
noremap L g_

" add newline below current line
map z<CR> o<Esc>
map Z<CR> O<Esc>

" Reindent file.
map <Leader>i mmgg=G`m

function! CurrenRelativeDirectory()
  let relative_dir = substitute(expand("%:p:h"), getcwd()."/", "", "")."/"
  return escape(relative_dir, " ")
endfunction

" Easy navigation for editing and coding
" nnoremap <leader>rr :r <C-r>=CurrenRelativeDirectory()<cr>
nnoremap <leader>er :e <C-r>=escape(expand("%:p:h"), ' ')<cr>/
nnoremap <Leader>eg :e ~/code/git/
nnoremap <Leader>eh :e ~/
nnoremap <Leader>cd :cd <C-r>=escape(expand("%:p:h"), ' ')<cr>/
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
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz

" map goyo
map <Leader>G :Goyo 140x70<cr>

" Use GV without hit colon
map <Leader>gv :GV<cr>
map <M-v> :GV<cr>

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

function! VisualFindAndReplace()
    :OverCommandLine%s///g
endfunction
function! VisualFindAndReplaceWithSelection() range
    :'<,'>OverCommandLine s///g
endfunction

" Shortcut to find and replace.
nnoremap <Leader>ra :call VisualFindAndReplace()<CR><left><left><left>
xnoremap <Leader>ra :call VisualFindAndReplaceWithSelection()<CR><left><left><left>

" Git push stash code
map <Leader>gw :!git add . && git commit -m 'WIP' && git push<cr>

" Quickly open recently files
" nmap <leader>ap :e config/application.yml<cr>
map <Leader>sc :sp db/schema.rb<cr>
nmap <leader>mp :e ~/code/git/dotfiles/vim/speedup.vim<cr>

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

nmap <leader>ba :bufdo bd<cr>

" Add binding.
nnoremap <leader>bd orequire "pry"; binding.pry<esc>

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
nnoremap <C-t> <C-i>zz
nnoremap <C-o> <C-o>zz

" Reload configuration file
map <leader>sop :source ~/.config/nvim/init.vim<cr>

" Alternative way for fugutive
nnoremap <silent> Ub             :Gblame<cr>
nnoremap <silent> Ud :if &diff<bar>diffupdate<bar>else<bar>Gdiff<bar>endif<cr>
nnoremap <silent> Ue             :Gedit<cr>
nnoremap          Uf             :Gcommit --fixup=
nnoremap <silent> Ugf            :Gedit <C-R><C-W><cr>
nnoremap <silent> Ul :GV! -100<cr>
nnoremap <silent> Ur             :Gread<cr>
nmap     <silent> Us             :Gstatus<cr> <C-N>
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
nmap     ZT     :tabclose<cr>
nnoremap <M-h> :aboveleft vsplit<CR>
nnoremap <M-j> :belowright split<CR>
nnoremap <M-k> <C-W>s
nnoremap <M-l> <C-W>v
nnoremap <silent> <M-t> :tab split<cr>

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

nnoremap Q @q

" Retag
function! RenewTagsFile()
  exe 'silent !rm tags'
  exe 'silent !ctags -a -Rf tags --exclude=.git --exclude="*.min.js" --exclude=node_modules --exclude=admin/node_modules --exclude=tmp 2>/dev/null'
  exe 'redraw!'
endfunction
nnoremap <Leader>rt :call RenewTagsFile()<CR>

function! NumberToggle()
  if(&relativenumber == 1)
    if (&number == 1)
      set nonumber
      set norelativenumber
    else
      set number
    endif
  else
    set relativenumber
  endif
endfunc
command! NumberToggle call NumberToggle()
noremap <F5> :NumberToggle<cr>

" Convert Ruby 1.8 to 1.9 Hash Syntax
" http://robots.thoughtbot.com/convert-ruby-1-8-to-1-9-hash-syntax
if !exists("*ConvertRubyHashSyntax")
  function ConvertRubyHashSyntax()
    %s/:\([^ ]*\)\(\s*\)=>/\1:/g
    ''
  :endfunction
endif

nnoremap <leader>h :call ConvertRubyHashSyntax()<CR>

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

" Open built-in Terminal
nnoremap <M-z> :terminal<cr>

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

" Command to remove trailing whitespaces
command! Tws %s/\s\+$//

" Disable default leader key of EasyMotion
map <Nop> <Plug>(easymotion-prefix)

" Search in project, but open at bottom of screen.
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, '--color-path 400 --color-line-number 400', fzf#vim#with_preview())

" as well as above, but open in full screen.
" command! -bang -nargs=* Ag
"   \ call fzf#vim#ag(<q-args>,
"   \                 <bang>0 ? fzf#vim#with_preview('up:60%')
"   \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
"   \                 <bang>0)

" Search file and also show preview.
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Test file
nnoremap <leader>tf :TestFile<cr>
nnoremap <leader>ts :TestNearest<cr>
nnoremap <leader>tl :TestLast<cr>

" Go to definition in js
nnoremap td :TernDef<cr>zz

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

" Correct indent while pasting
nnoremap p p=`]

" Highlight current word without move to the next
nnoremap * *Nzz

function! Dotfiles()
  :Files ~/code/git/dotfiles
endfunction
command! Dotfiles call Dotfiles()

function! ToggleAutoFix()
  if g:ale_fix_on_save == 1
    let g:ale_fix_on_save = 0
  else
    let g:ale_fix_on_save = 1
  endif
endfunction
command! ToggleAutoFix call ToggleAutoFix()

imap uu _
cnoremap uu _
imap hh =>

nnoremap <silent> <leader>rd :redraw!<cr>

" Tmux-runner
map <leader>sl :VtrSendLinesToRunner<cr>
nnoremap <leader>ap :VtrAttachToPane<cr>
nnoremap <leader>rr :VtrFocusRunner<cr>

" vim:ft=vim
