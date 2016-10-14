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

" Remap the default <C-Y> leader of Emmet Plugin
let g:user_emmet_leader_key='<C-Z>'

" CTRL-N and CTRL-P to revious-history instead of down and up.
let g:fzf_history_dir = '~/.fzf-history'

if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

" Lexima settings
let g:lexima_enable_basic_rules=1
let g:lexima_enable_newline_rules=1
let g:lexima_enable_endwise_rules=1

let g:startify_custom_header = [
      \ '                                ',
      \ '            __                  ',
      \ '    __  __ /\_\    ___ ___      ',
      \ '   /\ \/\ \\/\ \ /'' __` __`\   ',
      \ '   \ \ \_/ |\ \ \/\ \/\ \/\ \   ',
      \ '    \ \___/  \ \_\ \_\ \_\ \_\  ',
      \ '     \/__/    \/_/\/_/\/_/\/_/  ',
      \ ]

