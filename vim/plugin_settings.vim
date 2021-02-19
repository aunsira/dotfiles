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
  let $FZF_DEFAULT_OPTS .= "--ansi"
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
let g:fzf_buffers_jump = 1
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '~20%' }
let g:fzf_preview_window = []

" Disable default key of vim-move
let g:move_map_keys = 0

" Linter
let g:ale_fixers = {
  \ 'javascript': ['eslint', 'prettier'],
  \ 'ruby': ['rubocop'],
  \ 'elixir': ['mix_format']
  \ }
let g:ale_lint_delay = 1000
let g:ale_javascript_prettier_use_local_config = 1
" let g:ale_fix_on_save = 1
let g:ale_set_highlights = 0
let g:ale_enabled = 0

" vim-javascript
let g:javascript_plugin_jsdoc = 1

" javascript library syntax
let g:used_javascript_libs = 'jquery,underscore,react,requirejs,handlebars'

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

let g:go_term_mode = "split"
let g:go_term_enabled = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 0
let g:go_def_mode = "guru"
let g:go_echo_command_info = 1
let g:go_gocode_autobuild = 0
let g:go_gocode_unimported_packages = 1
let g:go_autodetect_gopath = 1
let g:go_info_mode = "guru"
let g:go_doc_keywordprg_enabled = 0

let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 0

" JSX
let g:jsx_ext_required = 0

" vim-closetag
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.html.erb'

" UltiSnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/code/git/dotfiles/vim/snips']
let g:UltiSnipsEditSplit= "context"
let g:UltiSnipsExpandTrigger = '<C-]>'
let g:UltiSnipsJumpForwardTrigger = '<C-]>'
let g:UltiSnipsJumpBackwardTrigger = '<C-[>'

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
    \   ['foo', 'bar', 'baz']
    \ ]

" Allow netrw to remove non-empty local directories
let g:netrw_localrmdir='rm -r'

let g:alchemist_tag_disable = 1

" vim-grammarous
let g:grammarous#disabled_rules = {
      \ '*' : ['WHITESPACE_RULE', 'EN_QUOTES', 'SENTENCE_WHITESPACE', 'UPPERCASE_SENTENCE_START'],
      \ }

" vim match-up
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_status_offscreen = 0
let g:matchup_matchparen_enabled = 0

let g:projectionist_heuristics = {
      \ '*.go': {
      \   '*.go': {
      \       'alternate': '{}_test.go',
      \       'type': 'source'
      \   },
      \   '*_test.go': {
      \       'alternate': '{}.go',
      \       'type': 'test'
      \   }
      \ },
      \ "*.rb": {
      \     "*.rb": { "alternate": "{}_spec.rb" },
      \     "*_spec.rb": { "alternate": "{}.rb" },
      \   }
      \ }

" https://thoughtbot.com/blog/extending-rails-vim-with-custom-commands
let g:rails_projections = {
  \ "app/serializers/*_serializer.rb": {
  \   "command": "serializer",
  \   "template": "class {camelcase|capitalize|colons}Serializer < ActiveModel::Serializer\n  include FastJsonapi::ObjectSerializer\n\n  attributes\nend"
  \ },
  \ "app/models/*.rb": {
  \   "command": "model",
  \   "template": "class {camelcase|capitalize|colons} < ApplicationRecord\nend"
  \ },
  \ "spec/factories/*.rb": {
  \   "command": "factory",
  \   "template": "FactoryBot.define do\n  factory :{underscore} do\n  end\nend"
  \ },
  \ "app/uploaders/*_uploader.rb": {
  \   "command": "uploader",
  \   "template": "class {camelcase|capitalize|colons}Uploader < CarrierWave::Uploader::Base\n  include CarrierWave::MiniMagick\nend"
  \ },
  \ "app/api/v1/*_api.rb": {
  \   "command": "api",
  \   "template": "class V1::{camelcase|capitalize|colons}API < Grape::API\n  resources :{underscore|plural} do\n  end\nend"
  \ },
  \ "spec/*_controller_spec.rb": {
  \   "alternate": ["app/controllers/{}_controller.rb"]
  \ },
  \ "spec/api/*_spec.rb": {
  \   "alternate": ["app/api/{}.rb"],
  \   "template": "require 'rails_helper'\n\ndescribe {camelcase|capitalize|colons}, type: :api do\nend"
  \ },
  \ "app/api/*.rb": {
  \   "alternate": ["spec/api/{}_spec.rb"]
  \ },
  \ "app/controllers/*_controller.rb": {
  \   "spec": ["spec/{}_controller_spec.rb"]
  \ } }

function! MKDPSplit(url)
  call system('x5050 left Safari '.shellescape(a:url))
endfunction
let g:mkdp_browserfunc = 'MKDPSplit'
let g:mkdp_browser = 'Safari'

" want the default to scroll down the list
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']

" Use Crtlp for only switching between buffers, so disable the ctrl-p mapping
" let g:ctrlp_map = ''

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 1

" Don't jump to a different place just because the file is already open, dingus
let g:ctrlp_switch_buffer = 0

" Ignore certain directories
let g:ctrlp_custom_ignore = '_site'

" vim:ft=vim
