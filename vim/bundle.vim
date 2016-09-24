" Bundle plugins
" ==========================================================================

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby' , { 'for': 'rb' }
Plugin 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plugin 'mileszs/ack.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'flazz/vim-colorschemes'
Plugin 'morhetz/gruvbox'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mattn/emmet-vim', { 'for': 'html' }
Plugin 'tpope/vim-surround'
Plugin 'alvan/vim-closetag'
Plugin 'pangloss/vim-javascript', { 'for': ['js', 'jsx'] }
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-commentary'
Plugin 'troydm/easybuffer.vim'
Plugin 'christoomey/vim-conflicted'
Plugin 'vim-scripts/ReplaceWithRegister'
if has("gui_running")
  " Use CtrlP instead of FZF in MacVim
  Plugin 'kien/ctrlp.vim'
endif

call vundle#end()
