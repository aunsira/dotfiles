let mapleader = "\<Space>"

function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/.config/nvim/' . a:directory . '/*'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
      execute 'source' config_file
    endif
  endfor
endfunction

call s:SourceConfigFilesIn('custom')
call s:SourceConfigFilesIn('local')

" Remove trailing whitespace on save for ruby files
autocmd BufWritePre *.rb :%s/\s\+$//e
" Disable next line commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Redefine :Ag command
autocmd VimEnter * command! -nargs=* Ag
      \ call fzf#vim#ag(<q-args>, '--color-path 400 --color-line-number 400', fzf#vim#default_layout)
