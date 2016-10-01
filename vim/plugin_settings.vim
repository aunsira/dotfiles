" Plugins customization
" =======================================================================

" Set Powerline
let g:Powerline_symbols = 'fancy'

" Set close tag filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb"

" Show hidden files in nerdtree
let NERDTreeShowHidden=1

" Set ignore case for Easy motion
let g:EasyMotion_smartcase = 1

" Whitespace warning
let ruby_space_errors=1
let c_space_errors=1

" Alias Ack with Ag instead
let g:ackprg = 'ag --vimgrep'

" Remap the default <C-Y> leader of Emmet Plugin
let g:user_emmet_leader_key='<C-Z>'

" CTRL-N and CTRL-P to revious-history instead of down and up.
let g:fzf_history_dir = '~/.fzf-history'

" Set Smartcase for popup completion
let g:kompleter_case_sensitive = 2

" Lexima settings
let g:lexima_enable_basic_rules=1
let g:lexima_enable_newline_rules=1
let g:lexima_enable_endwise_rules=1


" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
"
" " Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
