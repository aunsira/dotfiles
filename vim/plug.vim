call plug#begin('~/.config/nvim/plugged')

Plug 'AaronLasseigne/yank-code'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'beloglazov/vim-textobj-quotes'
Plug 'bronson/vim-trailing-whitespace'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-system-copy'
Plug 'dcampos/nvim-snippy'
Plug 'easymotion/vim-easymotion'
Plug 'ekalinin/Dockerfile.vim', {'for' : 'Dockerfile'}
Plug 'elixir-editors/vim-elixir'
Plug 'elzr/vim-json'
Plug 'ervandew/supertab'
Plug 'github/copilot.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': ':call mkdp#util#install()', 'for': 'markdown', 'on': 'MarkdownPreview' }
Plug 'itchyny/vim-cursorword'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim', { 'on' : 'GV' }
Plug 'junegunn/vim-after-object'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'junegunn/vim-peekaboo'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'matze/vim-move'
Plug 'nanotech/jellybeans.vim'
Plug 'nelstrom/vim-visual-star-search'
Plug 'pbrisbin/vim-mkdir'
Plug 'plasticboy/vim-markdown'
Plug 'rizzatti/dash.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tyru/open-browser.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vim-scripts/ReplaceWithSameIndentRegister'
Plug 'yegappan/mru'

call plug#end()

" vim:ft=vim
