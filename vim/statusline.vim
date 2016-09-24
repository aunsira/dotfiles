" ======================== Statusline configurations ========================
"define 3 custom highlight groups
hi User1 ctermbg=lightgray ctermfg=yellow guifg=orange guibg=#444444 cterm=bold gui=bold
hi User2 ctermbg=lightgray ctermfg=red guifg=#dc143c guibg=#444444 gui=none
hi User3 ctermbg=lightgray ctermfg=red guifg=#ffff00 guibg=#444444 gui=bold

set statusline= " Clear the statusline for vimrc reloads

set stl=%*                       " Normal statusline highlight
set stl+=%{InsertSpace()}        " Put a leading space in

set stl+=%1* 				             " Red highlight
set stl+=%{HasPaste()}           " Red show paste
set stl+=%*                      " Return to normal stl hilight

set stl+=%t                      " Filename

set stl+=%2* 				             " Red highlight
set stl+=%m                      " Modified flag

set stl+=%*                      " Return to normal stl hilight
set stl+=%r                      " Readonly flag
set stl+=%h                      " Help file flag

set stl+=%*                      " Set to 3rd highlight
set stl+=\ %y                    " Filetype

set stl+=%=                      " Right align from here on
set statusline+=%{SlSpace()}     " Vim-space plugin current setting
set stl+=\ \ Col:%c              " Column number
set stl+=\ \ Line:%l/%L          " Line # / total lines
set stl+=\ \ %P%{InsertSpace()}  " Single space buffer

set stl+=%2* 				             " Yello highlight
set stl+=%{ConflictedVersion()}  " Red show paste
set stl+=%*                      " Return to normal stl hilightrstrst

function! SlSpace()
    if exists("*GetSpaceMovement")
        return "[" . GetSpaceMovement() . "]"
    else
        return ""
    endif
endfunc

function! InsertSpace()
    " For adding trailing spaces onto statusline
    return ' '
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/nation/', "~/", "g")
    return curdir
endfunction
" ======================== END Statusline configurations =====================

