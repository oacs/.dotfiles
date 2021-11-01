let mapleader=" "
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>t :tabnew<CR>
nmap <Leader>[ <C-w>
nmap <Leader>cp :let @* = expand("%")<CR>
nmap <Leader>bp :bp<CR>
nmap <Leader>bn :bn<CR>
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
nnoremap <F5> :UndotreeToggle<CR>
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

" greatest remap ever
xnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d
