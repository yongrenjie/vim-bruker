function! DetectBruker()
    if !did_filetype()
        if search('\#include <[A-Za-z]\+\.incl>', 'n')
            setfiletype bruker
        endif
    endif
endfunction

augroup bruker_ftdetect
    au BufRead,BufNewFile * call DetectBruker()
augroup END
