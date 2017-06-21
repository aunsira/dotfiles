augroup MODIFIED_FLAG
  au!
  au FileChangedShellPost * let b:modified = 1
  au BufRead,BufWrite * if exists('b:modified') |
        \   unlet b:modified |
        \ endif
augroup END

" Flags for statusline
function! _s_flags()
  let flags = []

  " See if anything has changed git-wise
  if exists('*GitGutterGetHunkSummary')
    let gits = 0
    for i in GitGutterGetHunkSummary()
      let gits += i
    endfor
    if gits
      call add(flags, '~')
    endif
  endif

  " See if file externally modified
  if exists('b:modified')
    call add(flags, '!')
  endif

  return join(flags, ',')
endfunction

" Returns 've' if virtualedit is not off
function! _s_ve()
  return (&ve == '') ? '' : 've'
endfunction

" Returns file's syntax
function! _s_syntax()
  return (&syntax != '') ? &syntax : 'plaintext'
endfunction

" Safely gives gutentags status
function! _s_gutentags()
  if !exists('*gutentags#statusline')
    return ''
  endif
  return gutentags#statusline('Generating tags...')
endfunction

" Safely gives syntastic status
function! _s_syntastic()
  if !exists('*SyntasticStatuslineFlag')
    return ''
  endif
  return SyntasticStatuslineFlag()
endfunction

set statusline=\                                " initialize w/ space
set statusline+=%f                              " relative path
set statusline+=%(\ [%{_s_flags()}%M%R]%)       " flags
set statusline+=\ %#ErrorMsg#                   " error highlight
set statusline+=%(\ %{_s_syntastic()}%)         " syntastic
set statusline+=%#WarningMsg#                   " warning highlight
set statusline+=%(\ %{_s_gutentags()}%)         " gutentags
set statusline+=%#Normal#                       " no highlight
set statusline+=%=                              " left/right separator
set statusline+=%*                              " statusline highlight
set statusline+=%(\ %{_s_ve()}\ %)%#Normal#\  " virtualedit
set statusline+=\ %#Normal#\ %*                 " separator
set statusline+=\ %{_s_syntax()}                " syntax
set statusline+=\ %#Normal#\ %*                 " separator
set statusline+=\ %2c\ -\ %3l/%L                " x, y/ymax
set statusline+=\                               " end w/ space

" Disable next line commenting
au FileType * set fo-=c fo-=r fo-=o
