" Bundle plugins
" ==========================================================================

call plug#begin('~/.config/nvim/plugged')
Plug 'AndrewRadev/splitjoin.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-buftabline'
Plug 'christoomey/vim-conflicted'
Plug 'christoomey/vim-tmux-navigator'
Plug 'cohama/lexima.vim'
Plug 'dyng/ctrlsf.vim', { 'on' : 'CtrlSF' }
Plug 'easymotion/vim-easymotion'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'ervandew/supertab'
Plug 'evanmiller/nginx-vim-syntax', { 'for': 'nginx' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/gv.vim', { 'on' : 'GV' }
Plug 'junegunn/vim-peekaboo'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'mxw/vim-jsx', { 'for': ['jsx'] }
Plug 'pangloss/vim-javascript', { 'for': ['js', 'jsx'] }
Plug 'qpkorr/vim-bufkill'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'sirakij/vim-thai-keys'
Plug 'skalnik/vim-vroom', { 'for': ['rb'] }
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-commentary', { 'on': '<Plug>Commentary' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tyru/open-browser-github.vim'
Plug 'tyru/open-browser.vim'
Plug 'vim-ruby/vim-ruby' , { 'for': 'rb' }
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'wellle/targets.vim'

call plug#end()
