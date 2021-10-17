set completeopt=menuone,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
fun! LspLocationList()
	    " lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
endfun
nnoremap <leader>sd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>sr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>si <cmd>lua require('telescope.builtin').lsp_implementations()<cr>
nnoremap <leader>sh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>ss :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>sl :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <leader>sf <cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>

nnoremap <leader>ca <cmd>lua require('telescope.builtin').lsp_code_actions()<cr>

nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>gn :lua vim.lsp.diagnostic.goto_next()<CR>

nnoremap <leader>ll :call LspLocationList()<CR>

augroup THE_PRIMEAGEN_LSP
    autocmd!
    autocmd! BufWrite,BufEnter,InsertLeave * :call LspLocationList()
augroup END


