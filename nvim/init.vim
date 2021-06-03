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

call plug#end()

lua require('oacs')

colorscheme onedark

augroup highlight_yank
    autocmd!
        autocmd TextYankPost * silent! lua
        require'vim.highlight'.on_yank({timeout = 40})
        augroup END
