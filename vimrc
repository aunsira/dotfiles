filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'easymotion/vim-easymotion'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby' , { 'for': 'rb' }
Plugin 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plugin 'mileszs/ack.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'flazz/vim-colorschemes'
" Plugin 'morhetz/gruvbox'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mattn/emmet-vim', { 'for': 'html' }
Plugin 'tpope/vim-surround'
Plugin 'alvan/vim-closetag'
Plugin 'pangloss/vim-javascript', { 'for': ['js', 'jsx'] }
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-commentary'
Plugin 'troydm/easybuffer.vim'

call vundle#end()

let g:gruvbox_contrast_dark='hard'

filetype plugin indent on
syntax on
set t_Co=256
set backspace=indent,eol,start    " more powerful backspacing
set tabstop=2                     " size of a hard tabstop
set shiftwidth=2                  " size of an indent
set ignorecase                    " ignore case in search
set softtabstop=2                 " a combination of spaces and tabs are used to simulate tab stops at a width other than the (hard)tabstop
set smarttab                      " make 'tab' insert indents instead of tabs at the beginning of a line
set showmatch                     " show bracket matches"
set hlsearch                      " highlight all search matches"
set incsearch                     " show search results as I type"
set autoindent
set smartindent
set nocompatible                  " Use Vim defaults instead of 100% vi compatibility
set laststatus=2
set encoding=utf-8
set scrolloff=5                   " Keep 5 lines below and above ther cursor
set guicursor+=a:blinkon0         " Disable all blinking cursor
set noswapfile
set guioptions-=L
set guioptions-=r
set background=dark
colorscheme gruvbox
set updatetime=250
set expandtab                     " always uses spaces instead of tab characters
set wildmenu                      " Enhanced tab completion
set colorcolumn=81
set ttyfast                       " We are on a quick terminal"
set lazyredraw
set number
set relativenumber                " Show numbers in column
set cursorline                    " Indicate what line we are on"
set splitbelow
set splitright

" Set theme/settings for macvim
if has("gui_running")
  syntax on
  set hlsearch
  colorscheme gruvbox
  set bs=2
  set ai
  set ruler
  set guifont=Monaco:h12
  " Use C-Space to Esc out of any mode
  nnoremap <C-Space> <Esc>:noh<CR>
  vnoremap <C-Space> <Esc>gV
  onoremap <C-Space> <Esc>
  cnoremap <C-Space> <C-c>
  inoremap <C-Space> <Esc>`^
endif

" Disable next line commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Remove trailing whitespace on save for ruby files
autocmd BufWritePre *.rb :%s/\s\+$//e

" Set whitespace character
set listchars=eol:¬,tab:→→,trail:~,extends:>,precedes:<
set list

" Set Powerline
let g:Powerline_symbols = 'fancy'

" Set close tag filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb"

let mapleader = "\<Space>"

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
" Shortcut for typing :Ack
nnoremap <leader>f :Ack<Space>

map <Leader>e :NERDTreeFind<CR>zz
map <Leader>q :q<CR>
map <Leader>s :w<CR>
" Switch buffers easier
map <leader>b :EasyBufferHorizontal<CR>
map <leader>w <C-w>w
vmap <leader>c "*y
nmap <leader>p "*p

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
nmap <C-p> :FZF<CR>
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

" Set ignore case for Easy motion
let g:EasyMotion_smartcase = 1

" Whitespace warning
let ruby_space_errors=1
let c_space_errors=1

" Highlight background of column line
hi ColorColumn guibg=#FF5733 ctermbg=237

" Alias Ack with Ag instead
let g:ackprg = 'ag --vimgrep'

" Remap the default <C-Y> leader of Emmet Plugin
let g:user_emmet_leader_key='<C-Z>'

" CTRL-N and CTRL-P to revious-history instead of down and up.
let g:fzf_history_dir = '~/.fzf-history'
