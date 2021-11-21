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

let g:neoformat_enabled_typescript = ['eslint_d', 'prettier']
let g:neoformat_enabled_vue = ['eslint_d', 'prettier']
let g:neoformat_enabled_javascript = [ 'prettier']
let g:neoformat_enabled_lua = [ 'prettier']
let g:neoformat_enabled_vim = [ 'prettier']
let g:neoformat_run_all_formatters = 1
