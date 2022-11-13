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

noremap <leader>] :call FzfTagsCurrentWord()<cr>

" Convert ruby symbol hash to string hash.
" (Use switch.vim to convert back to symbol hash)
function! StringHash()
  :s/\(\w\+\):/'\1' =>/g
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

function! Dotfiles()
  :Files ~/code/git/dotfiles
endfunction
command! Dotfiles call Dotfiles()

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

function! Staging()
  call feedkeys("/build\<cr>gcjnngck8jo- ")
  call feedkeys(system("git rev-parse --abbrev-ref HEAD"))
  call feedkeys("\<esc>13jo- ")
  call feedkeys(system("git rev-parse --abbrev-ref HEAD"))
  call feedkeys("\<esc> ")
endfunction

" Disable LSP Diagnostic
function! DisableDiagnostic()
  execute 'lua vim.diagnostic.config({virtual_text = false, signs = false})'
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


let s:mons_en = ['Jan', 'Feb', 'Mar', 'Apr',
               \ 'May', 'Jun', 'Jul', 'Aug',
               \ 'Sep', 'Oct', 'Nov', 'Dec']
let s:months_en = ['January', 'February', 'March', 'April',
                 \ 'May', 'June', 'July', 'August',
                 \ 'September', 'October', 'November', 'December']
let s:months_ru = ['января', 'февраля', 'марта', 'апреля',
                 \ 'мая', 'июня', 'июля', 'августа',
                 \ 'сентября', 'октября', 'ноября', 'декабря']

let s:months = extend(s:months_en, s:months_ru)
let s:months = extend(s:months, s:mons_en)

"" * ISO-8601 2020-03-21
"" * RU 21 марта 2020
"" * EN 10 December 2012
"" * EN December 10, 2012
"" * EN 10 Dec 2012
"" * EN Dec 10, 2012
func! s:date_textobj(inner)
    let save_cursor = getcurpos()
    let cword = expand("<cword>")
    if  cword =~ '\d\{4}'
        let rx = '^\|'
        let rx = '\%(\D\d\{1,2}\s\+\%(' . join(s:months, '\|') . '\)\)'
        let rx .= '\|'
        let rx .= '\%(\s*\%(' . join(s:months, '\|') . '\)\s\+\d\{1,2},\)'
        if !search(rx, 'bcW', line('.'))
            call search('\s*\D', 'bcW', line('.'))
        endif
    elseif cword =~ join(s:months, '\|')
        call search('^\|\D\ze\d\{1,2}\s\+', 'bceW')
    elseif cword =~ '\d\{1,2}'
        if !search('^\|\S\ze\%(' . join(s:months, '\|') . '\)\s\+\d\{1,2}', 'bceW')
            call search('^\|[^0-9\-]', 'becW')
        endif
    endif

    let rxdate = '\%(\d\{4}-\d\{2}-\d\{2}\)'
    let rxdate .= '\|'
    let rxdate .= '\%(\d\{1,2}\s\+\%(' . join(s:months, '\|') . '\)\s\+\d\{4}\)'
    let rxdate .= '\|'
    let rxdate .= '\%(\%(' . join(s:months, '\|') . '\)\s\+\d\{1,2},\s\+\d\{4}\)'
    if !a:inner
        let rxdate = '\s*\%('.rxdate.'\)\s*'
    endif

    if search(rxdate, 'cW')
        normal v
        call search(rxdate, 'ecW')
        return
    endif
    call setpos('.', save_cursor)
endfunc


xnoremap <silent> id :<C-u>call <sid>date_textobj(1)<CR>
onoremap id :<C-u>normal vid<CR>
xnoremap <silent> ad :<C-u>call <sid>date_textobj(0)<CR>
onoremap ad :<C-u>normal vad<CR>


"" Markdown header text object
" * inner object is the text between prev section header(excluded) and the next
"   section of the same level(excluded) or end of file.
" * an object is the text between prev section header(included) and the next section of the same
"   level(excluded) or end of file.
func! s:header_textobj(inner) abort
    let lnum_start = search('^#\+\s\+[^[:space:]=]', "ncbW")
    if lnum_start
        let lvlheader = matchstr(getline(lnum_start), '^#\+')
        let lnum_end = search('^#\{1,'..len(lvlheader)..'}\s', "nW")
        if !lnum_end
            let lnum_end = search('\%$', 'nW')
        else
            let lnum_end -= 1
        endif
        if a:inner && getline(lnum_start + 1) !~ '^#\+\s\+[^[:space:]=]'
            let lnum_start += 1
        endif

        exe lnum_end
        normal! V
        exe lnum_start
    endif
endfunc


onoremap <buffer><silent> ih :<C-u>call <sid>header_textobj(v:true)<CR>
onoremap <buffer><silent> ah :<C-u>call <sid>header_textobj(v:false)<CR>
xnoremap <buffer><silent> ih :<C-u>call <sid>header_textobj(v:true)<CR>
xnoremap <buffer><silent> ah :<C-u>call <sid>header_textobj(v:false)<CR>


"" Indent text object
"" Useful for python-like indentation based programming lanugages
func! s:indent_textobj(inner)
    if getline('.') =~ '^\s*$'
        let ln_start = s:detect_nearest_line()
        let ln_end = ln_start
    else
        let ln_start = line('.')
        let ln_end = ln_start
    endif

    let indent = indent(ln_start)
    if indent > 0
        while indent(ln_start) >= indent && ln_start > 0
            let ln_start = prevnonblank(ln_start-1)
        endwhile

        while indent(ln_end) >= indent && ln_end <= line('$')
            let ln_end = s:nextnonblank(ln_end+1)
        endwhile
    else
        while indent(ln_start) == 0 && ln_start > 0 && getline(ln_start) !~ '^\s*$'
            let ln_start -= 1
        endwhile
        while indent(ln_start) > 0 && ln_start > 0
            let ln_start = prevnonblank(ln_start-1)
        endwhile
        while indent(ln_start) == 0 && ln_start > 0 && getline(ln_start) !~ '^\s*$'
            let ln_start -= 1
        endwhile

        while indent(ln_end) == 0 && ln_end <= line('$') && getline(ln_end) !~ '^\s*$'
            let ln_end += 1
        endwhile
        while indent(ln_end) > 0 && ln_end <= line('$')
            let ln_end = s:nextnonblank(ln_end+1)
        endwhile
    endif

    if a:inner || indent == 0
        let ln_start = s:nextnonblank(ln_start+1)
    endif

    if a:inner
        let ln_end = prevnonblank(ln_end-1)
    else
        let ln_end = ln_end-1
    endif

    if ln_end < ln_start
        let ln_end = ln_start
    endif

    exe ln_end
    normal! V
    exe ln_start
endfunc


func! s:nextnonblank(lnum) abort
    let res = nextnonblank(a:lnum)
    if res == 0
        let res = line('$')+1
    endif
    return res
endfunc


func! s:detect_nearest_line() abort
    let lnum = line('.')
    let nline = s:nextnonblank(lnum)
    let pline = prevnonblank(lnum)
    if abs(nline - lnum) > abs(pline - lnum) || getline(nline) =~ '^\s*$'
        return pline
    else
        return nline
    endif
endfunc


onoremap <silent>ii :<C-u>call <sid>indent_textobj(v:true)<CR>
onoremap <silent>ai :<C-u>call <sid>indent_textobj(v:false)<CR>
xnoremap <silent>ii :<C-u>call <sid>indent_textobj(v:true)<CR>
xnoremap <silent>ai :<C-u>call <sid>indent_textobj(v:false)<CR>

" vim:ft=vim
