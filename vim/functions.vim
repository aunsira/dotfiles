function! VisualFindAndReplace()
    :OverCommandLine%s///g
endfunction
function! VisualFindAndReplaceWithSelection() range
    :'<,'>OverCommandLine s///g
endfunction

" Markdown Underlines
function! UnderlineHeading(level)
  if a:level == 1
    normal! yypVr=
  elseif a:level == 2
    normal! yypVr-
  else
    normal! I###<space>
  endif
endfunction

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

" do not clobber '[ '] on :write
function! SaveChangeMarks() abort
  let s:change_marks = [getpos("'["), getpos("']")]
endfunction

function! RestoreChangeMarks() abort
  call setpos("'[", s:change_marks[0])
  call setpos("']", s:change_marks[1])
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
  exe 'silent !ctags -a -Rf tags --exclude=.git --exclude="*.min.js" --exclude=node_modules --exclude=admin/node_modules --exclude=tmp 2>/dev/null'
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

" vim:ft=vim
