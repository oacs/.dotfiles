let mapleader=" "
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>t :tabnew<CR>
nmap <Leader>p <C-w>
nmap <Leader>cp :let @* = expand("%")<CR>
nmap <Leader>bp :bp<CR>
nmap <Leader>bn :bn<CR>
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>
" Don't use arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
" Easy quick of insert mode
imap jj <Esc>
