" Make navigating around splits easier
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Faster viewport scrolling (10 lines at a time)
nnoremap <C-e> 10<C-e>
nnoremap <C-y> 10<C-y>
vnoremap <C-e> 10<C-e>
vnoremap <C-y> 10<C-y>

" Switch between last two buffers
nnoremap <leader><tab> <C-^>

" Tab navigation
nnoremap [t :tabprevious<CR>
nnoremap ]t :tabnext<CR>

" Use C-Space to Esc out of any mode
nnoremap <C-Space> <Esc>:noh<cr>
vnoremap <C-Space> <Esc>gV
onoremap <C-Space> <Esc>
cnoremap <C-Space> <C-c>
inoremap <C-Space> <Esc>`^

" Go to position of last edit(`.) and recenter. Mnem: 'Go to Edit'
nnoremap ge `.zz

" move by line on the screen rather than by line in the file
nnoremap k gk
nnoremap j gj

" Emacs-like beginning and end of line.
inoremap <silent> <c-e> <esc>A
inoremap <silent> <c-a> <esc>I
noremap H ^
noremap L g_

" File opening
cnoremap <expr> %%  getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '%%'

" Easy navigation for editing and coding
nnoremap <leader>er :e <C-r>=fnameescape(expand('%:h')).'/'<cr>

" Jump list (to newer position)
nnoremap <C-t> <C-i>zz
nnoremap <C-o> <C-o>zz

" Execute macro in q
nnoremap Q @q

" Movement in command mode
cnoremap <c-a> <C-b>

" Stay in search mode in Vim by using Ctrl-g and Ctrl-t after searching for a pattern
" https://vimtricks.com/p/vimtrick-stay-in-search-mode/
cnoremap <c-s> <c-t>
cnoremap <c-t> <c-g>

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \ <bang>0 ? fzf#vim#with_preview('up:60%')
  \         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \ <bang>0)

" Fuzzy search
nnoremap <silent> <leader>f :Files<CR>

" Grep
nnoremap <leader>/ :grep! -Q ""<Space><Left><Left>

" Highlight current word without move to the next.
" Also mark position before search by using 'mu' and `u or gm to go back to last position.
nnoremap <silent> * mu:let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>zz
nnoremap <silent> <C-n> mu:let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>zz
vmap <C-n> *Nmu

" Remap default copy key from vim-system-copy
nmap cy <Plug>SystemCopy
nmap cY <Plug>SystemCopyLine
xmap cy <Plug>SystemCopy

" Easier to reach % for matching block/bracket
nmap <C-b> %
" textobj for matching block/bracket
xmap b i%
omap b i%

" textobj for matching quotes
xmap q iq
omap q iq

" textobj for word
xmap w iw
omap w iw

" Stay in visual after indenting
vnoremap < <gv
vnoremap > >gv
vnoremap <silent> <C-h> <gv
vnoremap <silent> <C-l> >gv

" reselect pasted text
nnoremap gp `[v`]

" tyru/open-browser.vim
nmap gx <Plug>(openbrowser-open)
vmap gx <Plug>(openbrowser-open)

" C-BS to word deletion
inoremap <M-BS> <C-W>
cnoremap <M-BS> <C-W>

" Delete forward
inoremap <C-d> <Del>

" Insert a pipe with ctrl-l
imap <c-l> \|><space>

" Switch to normal mode in terminal window by ctrl-o
tmap <C-o> <C-\><C-n>

" nvim-snippy
imap <expr> <C-]> snippy#can_expand_or_advance() ? '<Plug>(snippy-expand-or-advance)' : '<C-]>'

" Navigation in quickfix list
nnoremap ]q :cnext<cr>
nnoremap [q :cprevious<cr>

" Quicker access to Ex commands
nnoremap ; :
nnoremap : ;
xnoremap ; :

" Remap U to <C-r> for easier redo
nnoremap U <C-r>

" Removes doc lookup mapping because it's easy to fat finger and never useful.
nnoremap K k
vnoremap K k

" vim:ft=vim
