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

" vim-test
let test#strategy = {
      \ 'nearest': 'make_bang',
      \ 'file':    'make_bang'
      \}

" SplitJoin
let g:splitjoin_trailing_comma = 0
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0

" Allow netrw to remove non-empty local directories
let g:netrw_localrmdir='rm -r'

" want the default to scroll down the list
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']

" Adjust height option to Copen,,,when run test inside vim
" https://github.com/tpope/vim-dispatch/issues/177
" let g:dispatch_quickfix_height=25

" Disable netrw gx mapping
let g:netrw_nogx = get(g:, 'netrw_nogx', 1)

" Add text format surrounding with c key.
" For example: Surround a visual line with code block - VSc
let g:surround_99 = "```\r```"

" Tweak for ignoring trailing whitespaces in Fzf.
let g:extra_whitespace_ignored_filetypes = ['fzf']

" To get netrw buffers to close themselves.
let g:netrw_fastbrowse = 0

" Use Ag instead of Grep when available
if executable("ag")
  set grepprg=ag\ --vimgrep\ $*
  set grepformat=%f:%l:%c:%m
endif

" Global Projectionist
let g:projectionist_heuristics = json_decode(join(readfile(expand('~/.config/projections.json'))))

" vim-peekaboo
" Leader + " or Leader + @ to see contents of registers.
" (Avoid conflict with @ to repeat last command)
let g:peekaboo_prefix = '<leader>'

" vim:ft=vim
