" Edit the vim config
nnoremap <Leader>ve :e $MYVIMRC<CR>

" Edit the vim keys config
nnoremap <Leader>vk :e $HOME/.vim/keys.vim<CR>

" Reload the vimrc
nnoremap <Leader>vr :source $MYVIMRC<CR>

" Load load .todo file
nnoremap <Leader>t, :e ./.todo<CR>
nnoremap <Leader>t~ :e ~/.todo<CR>

" Yank and paste to the system buffer
nnoremap <leader>p <Esc>"+p
nnoremap <leader>P <Esc>"+P
vnoremap <leader>y "+y
nnoremap <leader>yl <Esc>@='"+yl'<CR>
nnoremap <leader>yw <Esc>@='"+yw'<CR>
nnoremap <leader>y$ <Esc>"+y$

" Ctrl-j + Ctrl+k to move lines up and down
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
inoremap <c-j> <Esc>:m .+1<CR>==gi
inoremap <c-k> <Esc>:m .-2<CR>==gi
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv
