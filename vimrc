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
" Seems that highlight color only work in vimrc
call HiColor()
call s:SourceConfigFilesIn('local')

" Remove trailing whitespace on save for ruby files
autocmd BufWritePre *.rb :%s/\s\+$//e
" Disable next line commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
