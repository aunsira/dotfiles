function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

function! Save()
  if &filetype != 'MARKDOWN'
    execute 'FixWhitespace'
  endif
  execute ':wa!'
endfunction

" Google
function! Goog(pat, lucky)
  let q = '"'.substitute(a:pat, '["\n]', ' ', 'g').'"'
  let q = substitute(q, '[[:punct:] ]',
       \ '\=printf("%%%02X", char2nr(submatch(0)))', 'g')
  call system(printf('open "https://www.google.com/search?%sq=%s"',
                   \ a:lucky ? 'btnI&' : '', q))
endfunction

" Retag
function! RenewTagsFile()
  exe 'silent !rm tags'
  exe 'silent !ctags -a -Rf tags --exclude=.git --exclude="*.min.js" --exclude=node_modules --exclude=admin/node_modules --exclude=tmp 2>/dev/null --exclude=coverage'
  exe 'redraw!'
endfunction
nnoremap <Leader>rt :call RenewTagsFile()<CR>

function! NumberToggle()
  if(&relativenumber == 1)
    if (&number == 1)
      set nonumber
      set norelativenumber
    else
      set number
    endif
  else
    set relativenumber
  endif
endfunc
command! NumberToggle call NumberToggle()

function! Dotfiles()
  :Files ~/code/git/dotfiles
endfunction
command! Dotfiles call Dotfiles()

function! ToggleAutoFix()
  if g:ale_fix_on_save == 1
    let g:ale_fix_on_save = 0
  else
    let g:ale_fix_on_save = 1
  endif
endfunction
command! ToggleAutoFix call ToggleAutoFix()

" Merge a tab into a split in the previous window
function! MergeTabs()
  if tabpagenr() == 1
    return
  endif
  let bufferName = bufname("%")
  if tabpagenr("$") == tabpagenr()
    close!
  else
    close!
    tabprev
  endif
  split
  execute "buffer " . bufferName
endfunction
command! MergeTabs call MergeTabs()

function! BufOnly(buffer, bang)
  if a:buffer == ''
    " No buffer provided, use the current buffer.
    let buffer = bufnr('%')
  elseif (a:buffer + 0) > 0
    " A buffer number was provided.
    let buffer = bufnr(a:buffer + 0)
  else
    " A buffer name was provided.
    let buffer = bufnr(a:buffer)
  endif

  if buffer == -1
    echohl ErrorMsg
    echomsg "No matching buffer for" a:buffer
    echohl None
    return
  endif

  let last_buffer = bufnr('$')

  let delete_count = 0
  let n = 1
  while n <= last_buffer
    if n != buffer && buflisted(n)
      if a:bang == '' && getbufvar(n, '&modified')
        echohl ErrorMsg
        echomsg 'No write since last change for buffer'
              \ n '(add ! to override)'
        echohl None
      else
        silent exe 'bdel' . a:bang . ' ' . n
        if ! buflisted(n)
          let delete_count = delete_count+1
        endif
      endif
    endif
    let n = n+1
  endwhile

  if delete_count == 1
    echomsg delete_count "buffer deleted"
  elseif delete_count > 1
    echomsg delete_count "buffers deleted"
  endif

endfunction
command! -nargs=? -complete=buffer -bang Bonly
      \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BOnly
      \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang Bufonly
      \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BufOnly
      \ :call BufOnly('<args>', '<bang>')

" Requires 'jq' (brew install jq)
function! s:PrettyJSON()
  %!jq .
  set filetype=json
endfunction
command! PrettyJSON :call <sid>PrettyJSON()

" del, mov, co, Commentary then go back to last position
command! -nargs=+ DelUp execute call('printf', ['-%s,-%s del'] + split(<q-args>, ' ')) | normal! \"<C-o>
command! -nargs=+ DelDown execute call('printf', ['+%s,+%s del'] + split(<q-args>, ' ')) | normal! \"<C-o>
command! -nargs=+ MovUp execute call('printf', ['-%s,-%s mov.'] + split(<q-args>, ' ')) | normal! \"<C-o>
command! -nargs=+ MovDown execute call('printf', ['+%s,+%s mov.'] + split(<q-args>, ' ')) | normal! \"<C-o>
command! -nargs=+ CoUp execute call('printf', ['-%s,-%s co.'] + split(<q-args>, ' ')) | normal! \"<C-o>
command! -nargs=+ CoDown execute call('printf', ['+%s,+%s co.'] + split(<q-args>, ' ')) | normal! \"<C-o>
command! -nargs=+ GcUp execute call('printf', ['-%s,-%s Commentary'] + split(<q-args>, ' ')) | normal! \"<C-o>
command! -nargs=+ GcDown execute call('printf', ['+%s,+%s Commentary'] + split(<q-args>, ' ')) | normal! \"<C-o>

" Count word
command! -nargs=1 Count execute printf('%%s/%s//gn', escape(<q-args>, '/')) | normal! ``

function! ToggleGstatus()
  if buflisted(bufname('.git/index'))
    bd .git/index
  else
    execute printf(':Gstatus') | normal! gg4j
  endif
endfunction
command! ToggleGstatus :call ToggleGstatus()

" vim:ft=vim
