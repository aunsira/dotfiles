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

" Remap jump to definition for ctags
function! FzfTagsCurrentWord()
  let l:word = expand('<cword>')
  let l:list = taglist(l:word)
  if len(l:list) == 1
    execute ':tag ' . l:word
  else
    call fzf#vim#tags(l:word)
  endif
endfunction

noremap <leader>] :call FzfTagsCurrentWord()<cr><space>

" Convert ruby symbol hash to string hash.
" (Use switch.vim to convert back to symbol hash)
function! StringHash()
  :s/\(\w\+\):/"\1" =>/g
endfunction

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
  if buflisted(bufname('fugitive:///*/.git/'))
    execute ":bd" bufname('fugitive:///*/.git/')
  else
    execute printf(':Git') | normal! gg4j
  endif
endfunction
command! ToggleGstatus :call ToggleGstatus()

" https://ctoomey.com/writing/using-vims-arglist-as-a-todo-list/
function! s:ThankYouNext() abort
  update
  argdelete %
  bdelete
  if !empty(argv())
    argument
  endif
endfunction

command! ThankYouNext call <sid>ThankYouNext()

function! SquashAll()
  normal ggj}klllcf:w
endfunction

" https://gist.github.com/habamax/4662821a1dad716f5c18205489203a67
"" number text object
"" only "inner" text object: vin, din, cin
func! s:number_textobj()
    let rx_num = '\d\+\(\.\d\+\)*'
    if search(rx_num, 'ceW')
        normal v
        call search(rx_num, 'bcW')
    endif
endfunc

xnoremap <silent> in :<C-u>call <sid>number_textobj()<CR>
onoremap in :<C-u>normal vin<CR>

" vim:ft=vim
