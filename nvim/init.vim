call plug#begin('~/.vim/plugged')

" Themes
Plug 'joshdick/onedark.vim'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Plebvim lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend
" updating the parsers on update
Plug 'nvim-treesitter/playground'

Plug 'easymotion/vim-easymotion' " Jump

" Git
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'tpope/vim-fugitive'

" Prettier
Plug 'sbdchd/neoformat'

" Status bar
Plug 'hoob3rt/lualine.nvim'
Plug 'ryanoasis/vim-devicons'

" Files utils
Plug 'tpope/vim-eunuch'

call plug#end()

lua require('oacs')
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

let g:symbols_outline = {
    \ "highlight_hovered_item": v:true,
    \ "show_guides": v:true,
    \ "position": 'right',
    \ "auto_preview": v:true,
    \ "keymaps": {
        \ "close": "<Esc>",
        \ "goto_location": "<Cr>",
        \ "focus_location": "o",
        \ "hover_symbol": "<C-space>",
        \ "rename_symbol": "r",
        \ "code_actions": "a",
    \ },
    \ "lsp_blacklist": [],
\ }
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END

colorscheme onedark
