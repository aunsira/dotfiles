" Plugins customization
" ---------------------

" Set close tag filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb"

" Show hidden files in nerdtree
let NERDTreeShowHidden=1

" Set ignore case for Easy motion
let g:EasyMotion_smartcase = 1

" Whitespace warning
let ruby_space_errors=1
let c_space_errors=1

" vim-ruby
let g:ruby_indent_access_modifier_style = 'indent'
let g:ruby_indent_assignment_style = 'variable'

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

" Fzf Tweaks
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Disable default key of vim-move
let g:move_map_keys = 0

" Linter
let g:ale_fixers = {
  \ 'javascript': ['eslint']
  \ }
