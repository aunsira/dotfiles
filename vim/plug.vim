call plug#begin('~/.config/nvim/plugged')

Plug 'AaronLasseigne/yank-code'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'alvan/vim-closetag'
Plug 'andyl/vim-projectionist-elixir'
Plug 'andymass/vim-matchup'
Plug 'aunsira/vim-thai-keys'
Plug 'beloglazov/vim-textobj-quotes'
Plug 'bronson/vim-trailing-whitespace', {'commit': '9b472b1'}
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-system-copy'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'easymotion/vim-easymotion'
Plug 'ekalinin/Dockerfile.vim', {'for' : 'Dockerfile'}
Plug 'elixir-editors/vim-elixir'
Plug 'elzr/vim-json'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go', { 'for': 'go' }
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
Plug 'leafgarland/typescript-vim'
Plug 'matze/vim-move'
Plug 'nanotech/jellybeans.vim'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'nelstrom/vim-visual-star-search'
Plug 'pangloss/vim-javascript'
Plug 'pbrisbin/vim-mkdir'
Plug 'plasticboy/vim-markdown'
Plug 'rizzatti/dash.vim'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tyru/open-browser.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'wellle/targets.vim'
Plug 'yegappan/mru'

" LSP
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'neovim/nvim-lspconfig'

" Snippets
Plug 'dcampos/nvim-snippy'
Plug 'dcampos/cmp-snippy'

call plug#end()

" vim:ft=vim
