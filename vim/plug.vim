call plug#begin('~/.config/nvim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'SirVer/ultisnips'
Plug 'alvan/vim-closetag'
Plug 'andyl/vim-projectionist-elixir'
Plug 'andymass/vim-matchup'
Plug 'aunsira/vim-thai-keys'
Plug 'beloglazov/vim-textobj-quotes'
Plug 'bronson/vim-trailing-whitespace'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-system-copy'
Plug 'christoomey/vim-titlecase'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'cohama/lexima.vim'
Plug 'easymotion/vim-easymotion'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'elixir-editors/vim-elixir'
Plug 'elzr/vim-json'
Plug 'ervandew/supertab'
Plug 'fatih/molokai'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'iamcco/markdown-preview.nvim', { 'do': ':call mkdp#util#install()', 'for': 'markdown', 'on': 'MarkdownPreview' }
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'jordwalke/VimSplitBalancer'
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
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'mhinz/vim-mix-format'
Plug 'moll/vim-node'
Plug 'mxw/vim-jsx'
Plug 'nanotech/jellybeans.vim'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'nelstrom/vim-visual-star-search'
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'pangloss/vim-javascript'
Plug 'pbrisbin/vim-mkdir'
Plug 'qpkorr/vim-bufkill'
Plug 'rhysd/vim-grammarous'
Plug 'rizzatti/dash.vim'
Plug 'slashmili/alchemist.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary', { 'on': '<Plug>Commentary' }
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby', 'haml', 'slim'] }
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vim-scripts/SyntaxRange'
Plug 'vim-scripts/ingo-library'
Plug 'w0rp/ale'
Plug 'wellle/targets.vim'

call plug#end()

" vim:ft=vim
