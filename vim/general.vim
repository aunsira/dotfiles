set backspace=indent,eol,start    " more powerful backspacing
set tabstop=2                     " size of a hard tabstop
set shiftwidth=2                  " size of an indent
set ignorecase                    " ignore case in search
set smartcase
set softtabstop=2                 " a combination of spaces and tabs are used to simulate tab stops at a width other than the (hard)tabstop
set smarttab                      " make 'tab' insert indents instead of tabs at the beginning of a line
set showmatch                     " show bracket matches"
set hlsearch                      " highlight all search matches"
set incsearch                     " show search results as I type"
set autoindent
set smartindent
set laststatus=2
set noswapfile
set background=dark
set updatetime=250
set expandtab                     " always uses spaces instead of tab characters
set wildmenu                      " Enhanced tab completion
set textwidth=90
set colorcolumn=+1
set showcmd
set lazyredraw
set splitbelow
set splitright
set visualbell
set nowrap
set foldlevelstart=0              " don't fold initially
set nostartofline
set confirm                       " confirm unsaved changes
set nohidden
set autoread
set timeoutlen=500
set ttimeout
set ttimeoutlen=1
set nocul
set re=1                          " use old regexpengine to avoid lagging scroll.
set termguicolors
set diffopt=filler,vertical
set tags=./tags;/                 " Set project directory's ctags
set scrolloff=5
set fillchars=vert:\│             " show/hide whitespace marker in insert mode
set mouse=a
set rtp+=~/code/git/dotfiles/vim
set path+=**                      " For clever completion with the :find command
set nu
set relativenumber
set completeopt-=preview
set clipboard=unnamed
set undofile                      " Maintain undo history between sessions
set undodir=/tmp//,.
set viminfo='1000                 " Oldfiles to 1000 last recently opened files, :History uses it
set maxmempattern=20000
set gdefault                      " assume the /g flag on :s substitutions to replace all matches in a line
set shiftround                    " When at 3 spaces and I hit >>, go to 4, not 5.
set nocursorcolumn                " speed up syntax highlighting
set noshowmatch                   " Do not show matching brackets by flickering

" vim:ft=vim
