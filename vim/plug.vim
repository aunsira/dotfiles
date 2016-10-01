" Bundle plugins
" ==========================================================================

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'christoomey/vim-conflicted'
Plug 'christoomey/vim-tmux-navigator'
Plug 'cohama/lexima.vim'
Plug 'easymotion/vim-easymotion'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'evanmiller/nginx-vim-syntax', { 'for': 'nginx' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'gmarik/Vundle.vim'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'kchmck/vim-coffee-script'
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'mileszs/ack.vim'
Plug 'morhetz/gruvbox'
Plug 'mxw/vim-jsx', { 'for': ['jsx'] }
Plug 'nanotech/jellybeans.vim'
Plug 'pangloss/vim-javascript', { 'for': ['js', 'jsx'] }
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'skalnik/vim-vroom', { 'for': ['rb'] }
Plug 'szw/vim-kompleter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'troydm/easybuffer.vim'
Plug 'vim-ruby/vim-ruby' , { 'for': 'rb' }
Plug 'vim-scripts/ReplaceWithRegister'

if has("gui_running")
  " Use CtrlP instead of FZF in MacVim
  Plug 'kien/ctrlp.vim'
endif

call plug#end()
