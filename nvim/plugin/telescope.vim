nnoremap <leader>ff <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <leader>gb :lua require('telescope.builtin').git_branches()<CR>
