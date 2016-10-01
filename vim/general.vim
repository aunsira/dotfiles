" General configurations
" ==========================================================================
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
set laststatus=2
set encoding=utf-8
set scrolloff=5                   " Keep 5 lines below and above ther cursor
set guicursor+=a:blinkon0         " Disable all blinking cursor
set noswapfile
set guioptions-=L
set guioptions-=r
set background=dark
set updatetime=250
set expandtab                     " always uses spaces instead of tab characters
set wildmenu                      " Enhanced tab completion
set colorcolumn=81
set lazyredraw
set number
set relativenumber                " Show numbers in column
set cursorline                    " Indicate what line we are on"
set splitbelow
set splitright
set visualbell

" Set theme/settings for macvim
if has("gui_running")
  set hlsearch
  set bs=2
  set ai
  set ruler
  set guifont=Monaco:h12
endif

" Set whitespace character
set listchars=eol:¬,tab:→→,trail:~,extends:>,precedes:<
set list

function! HiColor()
  " Set selected code color
  hi Visual term=reverse cterm=reverse guibg=Grey
  " Highlight background of column line
  hi ColorColumn guibg=#FF5733 ctermbg=237

  let g:gruvbox_contrast_dark='hard'
  colorscheme gruvbox

  " Statusline color
  hi StatusLine ctermbg=Black ctermfg=White
  hi StatusLineNC ctermbg=White ctermfg=Black
endfunction
