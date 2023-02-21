" Set ignore case for Easy motion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" vim-ruby
" let ruby_no_expensive = 0
let ruby_operators = 1
let ruby_space_errors=1
let ruby_spellcheck_strings = 1

let g:ruby_indent_access_modifier_style = 'normal'
let g:ruby_indent_assignment_style = 'hanging'
let g:ruby_indent_block_style = 'do'

" CTRL-N and CTRL-P to revious-history instead of down and up.
let g:fzf_history_dir = '~/.fzf-history'

if has('nvim')
  let $FZF_DEFAULT_OPTS .= "--ansi --bind alt-a:select-all"
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

" ALT-A CTRL-Q to select all and build quickfix list from Fzf.
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

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
let g:fzf_buffers_jump = 1
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '~20%' }
let g:fzf_preview_window = []

" Disable default key of vim-move
let g:move_map_keys = 0

" vim-javascript
let g:javascript_plugin_jsdoc = 1

" Try test nearest with dispatch
" vim-test
" let test#strategy = {
"       \ 'nearest': 'vtr',
"       \ 'file':    'dispatch',
"       \}
let test#strategy = {
      \ 'nearest': 'dispatch',
      \ 'file':    'dispatch',
      \}

" Plugin vim-rspec
let g:rspec_command = "!bin/rspec {spec}"

" Run vim-test with test environment
let $NODE_ENV='test'

let g:go_test_show_name = 1
let g:go_list_type = "quickfix"
let g:go_doc_keywordprg_enabled = 0

let g:go_autodetect_gopath = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_enabled = ['vet', 'golint']

let g:go_gopls_complete_unimported = 1

let g:go_imports_mode="gopls"
let g:go_imports_autosave=1

let g:go_highlight_build_constraints = 1
let g:go_highlight_operators = 1

let g:go_fold_enable = []

" vim-closetag
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.html.erb'

" SplitJoin
let g:splitjoin_trailing_comma = 0
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0

" switch.vim
let g:switch_mapping = ""
let g:switch_custom_definitions =
    \ [
    \   ['processing', 'processed', 'unprocessed'],
    \   ['approved', 'declined', 'kenta'],
    \   ['gnoon', 'gnui', 'gdee'],
    \   ['asc', 'desc'],
    \   ['if', 'unless'],
    \   ['foo', 'bar', 'baz']
    \ ]

" Allow netrw to remove non-empty local directories
let g:netrw_localrmdir='rm -r'

let g:alchemist_tag_disable = 1

" vim match-up
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_status_offscreen = 0
let g:matchup_matchparen_enabled = 0

function! MKDPSplit(url)
  call system('x5050 left Safari '.shellescape(a:url))
endfunction
let g:mkdp_browserfunc = 'MKDPSplit'
let g:mkdp_browser = 'Safari'

" want the default to scroll down the list
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']

" Adjust height option to Copen,,,when run test inside vim
" https://github.com/tpope/vim-dispatch/issues/177
" let g:dispatch_quickfix_height=25

" Disable netrw gx mapping
let g:netrw_nogx = get(g:, 'netrw_nogx', 1)

" Add text format surrounding with c key
let g:surround_99 = "```\r```"

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 0
let g:markdown_fenced_languages = [
  \ 'coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html',
  \ 'sh', 'bash=sh', 'scala']
let g:vim_markdown_conceal_code_blocks = 1

" Tweak for ignoring trailing whitespaces in Fzf.
let g:extra_whitespace_ignored_filetypes = ['fzf']

" To get netrw buffers to close themselves.
let g:netrw_fastbrowse = 0

" vim:ft=vim
