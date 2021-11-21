call plug#begin('~/.vim/plugged')

" Themes
"Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'glepnir/dashboard-nvim'

" Telescope
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
Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend
" updating the parsers on update
Plug 'nvim-treesitter/playground'

Plug 'easymotion/vim-easymotion' " Jump

" Git
"Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'tpope/vim-fugitive'

" Prettier
Plug 'sbdchd/neoformat'

" Status bar
Plug 'hoob3rt/lualine.nvim'
Plug 'ryanoasis/vim-devicons'

" Files utils
Plug 'tpope/vim-eunuch'

Plug 'nvim-lua/popup.nvim'
Plug 'ThePrimeagen/harpoon'


" Learning to use from here to down
Plug 'mbbill/undotree'
Plug 'code-biscuits/nvim-biscuits'
" Delete ( ) [ ] { } without inner content
Plug 'tpope/vim-surround'

Plug 'xiyaowong/nvim-transparent'

Plug 'github/copilot.vim'

Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
call plug#end()

lua require('oacs')


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

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" themes
"colorscheme onedark
colorscheme gruvbox

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
