set number
set mouse=a
set numberwidth=1
set clipboard+=unnamedplus
set showcmd
set ruler
set encoding=UTF-8
set showmatch
set relativenumber
set laststatus=2
set noshowmode
set ts=2
set sts=2
set ignorecase
set et     "expand tabs to spaces
set path+=**
set hidden
set foldmethod=manual
set foldexpr=nvim_treesitter#foldexpr()
set fml=16
let g:dashboard_default_executive ='telescope'
let g:lf_map_keys = 0

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

syntax enable

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

" npm install -g @fsouza/prettierd
let g:neoformat_enabled_vue = ['prettierd', 'eslint_d']
let g:neoformat_enabled_javascript = [ 'prettierd']
let g:neoformat_enabled_typescript = ['eslint_d']

" https://pkg.go.dev/cmd/gofmt
let g:neoformat_enabled_go = ['gofmt']

" luarocks install --server=https://luarocks.org/dev luaformatter
let g:neoformat_enabled_lua = [ 'lua-format']

let g:neoformat_enabled_vim = [ 'prettier']
" go install mvdan.cc/sh/v3/cmd/shfmt@latest
let g:neoformat_enabled_shell = [ 'shmft']
let g:neoformat_run_all_formatters = 1
let g:shfmt_opt="-ci"
