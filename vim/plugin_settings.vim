" Plugins customization
" =======================================================================

let g:gruvbox_contrast_dark='hard'

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
