" Bundle plugins
" ==========================================================================

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'airblade/vim-gitgutter'
Plugin 'alvan/vim-closetag'
Plugin 'christoomey/vim-conflicted'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'easymotion/vim-easymotion'
Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plugin 'kchmck/vim-coffee-script'
Plugin 'mattn/emmet-vim', { 'for': 'html' }
Plugin 'mileszs/ack.vim'
Plugin 'morhetz/gruvbox'
Plugin 'nanotech/jellybeans.vim'
Plugin 'pangloss/vim-javascript', { 'for': ['js', 'jsx'] }
Plugin 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'troydm/easybuffer.vim'
Plugin 'vim-ruby/vim-ruby' , { 'for': 'rb' }
Plugin 'vim-scripts/ReplaceWithRegister'
if has("gui_running")
  " Use CtrlP instead of FZF in MacVim
  Plugin 'kien/ctrlp.vim'
endif

call vundle#end()
