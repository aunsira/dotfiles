let s:ENV_FILE = '.env'
let s:SCHEMA_FILE = 'db/schema.rb'

command! EditEnvFile call <sid>SmartSplit(s:ENV_FILE)
command! EditSchemaFile call <sid>SmartSplit(s:SCHEMA_FILE)
nnoremap <leader>env :EditEnvFile<cr>
nnoremap <leader>sc :EditSchemaFile<cr>

autocmd BufEnter .env call <sid>LoadFile()
autocmd BufEnter db/schema.rb call <sid>LoadFile()

function! s:SmartSplit(file)
  let split_cmd = (winwidth(0) >= 100) ? 'vsplit' : 'split'
  execute split_cmd . " " . a:file
endfunction

function! s:LoadFile()
  nnoremap <buffer> q :wq<cr>
endfunction

" vim:ft=vim
