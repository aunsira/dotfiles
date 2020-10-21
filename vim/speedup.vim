" Shortcut for typing :Ag
nnoremap <leader>ag :Ag!<Space>
nnoremap <leader><BS> :Ag!<Space>
" Search in specific module
nnoremap <leader>rg :Rag!<Space>

" Write/Exit shortcuts
inoremap <C-s> <esc>:call Save()<cr>
nnoremap <C-s> <esc>:call Save()<cr>
inoremap <C-c> <esc>
" map <Leader>q :copen<cr><tab>
map <C-x> <C-w>c
nnoremap <silent><Leader>w <esc>:call Save()<cr>
nnoremap <silent><Leader>q :q!<cr>
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
map <leader>x y

" Remap jump to definition for ctags
nmap <leader>] g<C-]>zz

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
nnoremap <silent> ]t :tabn<cr>
nnoremap <silent> [t :tabp<cr>

" Use actually useful arrow keys
nnoremap <Left> :vertical resize +1<CR>
nnoremap <Right> :vertical resize -1<CR>
nnoremap <Up> :resize +1<CR>
nnoremap <Down> :resize -1<CR>

" New tab
nnoremap <leader>tn :tabe<cr>

" Map fzf plugin
nnoremap <silent> <C-p> :Files<cr>
nnoremap <silent> <M-BS> :Files<cr>
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-l> <plug>(fzf-complete-line)
imap <c-x><c-f> <plug>(fzf-complete-path)
nnoremap <leader>L :Lines<cr>
nnoremap <enter> :Buffers<cr>
nnoremap <silent> <Leader>` :Marks<CR>
nnoremap <leader>fa :Files app/<cr>
nnoremap <leader>fp :Files app/**/api<cr>
nnoremap <leader>fm :Files app/models/<cr>
nnoremap <leader>fc :Files app/controllers/<cr>
nnoremap <leader>ff :Files spec/factories<cr>
nnoremap <leader>fs :Files spec/<cr>

" Quickly open a second window to view files side by side
nmap <LEADER>vs :vsplit<CR>

" bind K to grep word under cursor
nnoremap K :Ag! <C-R><C-W><CR>
nnoremap <M-Tab> :Ag! <C-R><C-W><CR>
" bind K to grep word from visual selection
vnoremap K y:Ag! <C-R>"<CR>
vnoremap <leader><BS> y:Ag! <C-R>"<CR>
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

" Git shortcuts
map <leader>gs :Gstatus<cr>gg<c-n>
map <leader>gc :Gcommit<cr>
map <leader>gg :Gbrowse<cr>
map <leader>gb :Gblame<cr>
map <leader>gd :Gdiffsplit<cr>
map <leader>gh :Ghdiffsplit<cr>
map <leader>gp :Gpush<cr>
map <leader>ge :Gread<cr>

" Executes git cmd in the context of b:git_dir.
function! s:git_do(cmd) abort
  " git 1.8.5: -C is a (more reliable) alternative to --git-dir/--work-tree.
  return systemlist('git -C '.shellescape(fnamemodify(b:git_dir, ':p:h:h'))
        \ . ' ' . a:cmd)
endfunction

nnoremap <silent> Ub :Gblame<cr>
nnoremap <silent> Ud :<C-U>if &diff<bar>diffupdate<bar>elseif !v:count && empty(<SID>git_do('diff -- '.shellescape(FugitivePath())))<bar>echo 'no changes'<bar>else<bar>exe 'Gvdiff'.(v:count ? ' HEAD'.repeat('^', v:count) : '')<bar>call feedkeys('<c-v><c-l>')<bar>endif<cr>
nnoremap Uc :Gcommit<cr>
nnoremap Uf :Gcommit --fixup=
nnoremap <expr><silent> Ul '@_<cmd>GV'.(v:count?'':'!').'<cr>'
nnoremap <silent> Ur :Gread<cr>
nmap <silent> Us :Gstatus<cr>gg<c-n>
nnoremap <silent> Uw :if !exists(":Gwrite")<bar>call fugitive#detect(expand('%:p'))<bar>endif<bar>Gwrite<cr>
nnoremap <silent> Ug :Gbrowse<cr>

nmap UB Ub
nmap UD Ud
nmap UF Uf
nmap UL Ul
nmap UR Ur
nmap US Us
nmap UW Uw
nmap UC Uc

nmap  <silent> \<space> :ToggleGstatus<cr>
nnoremap \p :Gpush<cr>
nnoremap \b :Gblame<cr>
nnoremap <silent> \<tab> :<C-U>if &diff<bar>diffupdate<bar>elseif !v:count && empty(<SID>git_do('diff -- '.shellescape(FugitivePath())))<bar>echo 'no changes'<bar>else<bar>exe 'Gvdiff'.(v:count ? ' HEAD'.repeat('^', v:count) : '')<bar>call feedkeys('<c-v><c-l>')<bar>endif<cr>

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
nnoremap <leader>ed :Files ~/Dropbox/notes/<cr>

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

" Use Easymotion instead of normal vim search
map <Leader>/ <Plug>(easymotion-sn)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Kill buffer with leader + bd and keep the window presents
nnoremap <leader>bw :bp\|bd #<CR>

" Git push stash code
map <Leader>gw :!git add . && git commit -m 'WIP' && git push<cr>

" hub
map <leader>hb :!hub browse<cr>
map <leader>hc :!hub compare<cr>

" Quickly open recently files
map <Leader>sc :sp db/schema.rb<cr>

" Modes  \m mouseOff, \M mouseOn,
noremap <Leader>m :set mouse=<CR>
noremap <Leader>M :set mouse=a<CR>

" nnoremap <leader>u1 m`yypVr=``
" nnoremap <leader>u2 m`yypVr-``
nnoremap <leader>u1 m`^i# <esc>``2l
nnoremap <leader>u2 m`^i## <esc>``3l
nnoremap <leader>u3 m`^i### <esc>``4l
nnoremap <leader>u4 m`^i#### <esc>``5l
nnoremap <leader>u5 m`^i##### <esc>``6l

nmap <leader>ba :bufdo bd<cr>

" Add binding.
nnoremap <leader>bp orequire "pry"; binding.pry<esc>:call Save()<cr>

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

nnoremap <F5> :NumberToggle<cr>
nnoremap <F6> :setlocal spell! spell?<CR>

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
cnoremap <c-a> <C-b>

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
nnoremap <leader>cc :cc<cr>

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
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>zz
nnoremap <silent> <C-n> :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>zz
vmap <C-n> *<c-o>

" imap uu _
" cnoremap uu _

nnoremap <silent> <leader>rd :redraw!<cr>

" Tmux-runner
map <leader>sl :VtrSendLinesToRunner<cr>
nnoremap <leader>ap :VtrAttachToPane<cr>
nnoremap <leader>rr :VtrFocusRunner<cr>

nnoremap <leader>- :Switch<cr>

nnoremap <leader>lc q:k<C-c>

" Reduce `in` verb while operating
nmap t' gri'
nmap t" gri"
nmap t[ gri[
nmap t( gri(
nmap t{ gri{
nmap t9 gri(
nmap tw griw
nmap tl gril==
nmap tq griq

nmap yw yiw
nmap y' yi'
nmap y" yi"
nmap y[ yi[
nmap y( yi(
nmap y9 yi(
nmap y{ yi{
nmap y<Space> yt<Space>

nmap vw viw
nmap v' vi'
nmap v" vi"
nmap v[ vi[
nmap v( vi(
nmap v9 vi(
nmap v{ vi{
nmap v<Space> vt<Space>

nmap cw ciw
nmap c' ci'
nmap c" ci"
nmap c[ ci[
nmap c( ci(
nmap c{ ci{
nmap c9 ci(
nmap cl cil
nmap c<Space> ct<Space>

nmap d' di'
nmap d" di"
nmap d[ di[
nmap d( di(
nmap d9 di(
nmap d{ di{
nmap dw daw
nmap dl dil
nmap d<Space> dt<Space>

nmap 'w ysiw'
nmap "w ysiw"

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

" vim-rails
nnoremap <leader>A :A<cr>
nnoremap <leader>av :AV<cr>
nnoremap <leader>at :AT<cr>
nnoremap <leader>as :AS<cr>

" Insert current time
inoremap <silent> <C-G><C-T> <C-R>=repeat(complete(col('.'),map(["%Y-%m-%d %H:%M:%S","%a, %d %b %Y %H:%M:%S %z","%Y %b %d","%d-%b-%y","%a %b %d %T %Z %Y"],'strftime(v:val)')+[localtime()]),0)<CR>

" Close all but the current one
nnoremap <leader>o :only<CR>zz

" Open .env
nnoremap <silent> <leader>env :sp .env<cr>

nnoremap <leader>ue :UltiSnipsEdit<Space>
nnoremap <leader>tg :ALEToggle<cr>

nnoremap <leader>ss :!spring stop<cr>
nnoremap <leader>pp :!rails db:test:prepare<cr>

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

nnoremap <leader>hh :SidewaysLeft<cr>
nnoremap <leader>ll :SidewaysRight<cr>

nnoremap <leader><leader> :
vnoremap <leader><leader> :
nnoremap <leader>, :!

nnoremap [z I[ ]<Space><Esc>
nnoremap [x I[x]<Space><Esc>

inoremap uu _
cnoremap uu _

" vim:ft=vim
