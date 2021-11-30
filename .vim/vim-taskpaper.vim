call plug#begin()
Plug 'cweagans/vim-taskpaper'
call plug#end()

augroup taskpaper
     au! BufRead,BufNewFile *.todo   setfiletype taskpaper
augroup END

