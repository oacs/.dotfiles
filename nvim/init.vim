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
" Complete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

" Install snippet engine (This example installs [hrsh7th/vim-vsnip](https://github.com/hrsh7th/vim-vsnip))
" For vsnip user.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Install the buffer completion source
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

Plug 'nvim-lua/plenary.nvim' " don't forget to add this one if you don't have it yet!
Plug 'nvim-lua/popup.nvim'
Plug 'ThePrimeagen/harpoon'

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
