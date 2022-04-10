local map = function(mode, lhf, rhf)
	vim.api.nvim_set_keymap(mode, lhf, rhf, { noremap = true })
end

map("n", "<leader>ff", ":lua require('telescope.builtin').git_files()<cr>")
map("n", "<leader>fg", ":lua require('telescope.builtin').live_grep()<cr>")
map("n", "<leader>fb", ":lua require('telescope.builtin').buffers()<cr>")
map("n", "<leader>fh", ":lua require('telescope.builtin').help_tags()<cr>")
map("n", "<leader>fr", ":lua require('telescope.builtin').registers()<cr>")
map("n", "<leader>ft", ":lua require('custom_telescope').search_todos()<cr>")
map("n", "<leader>fl", ":lua require('telescope.builtin').quickfix()<cr>")

map("n", "<leader>gw", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
map("n", "<leader>gb", ":lua require('telescope.builtin').git_branches()<CR>")
map("n", "<leader>gs", ":lua require('telescope.builtin').git_stash()<CR>")

map("n", "<leader>ts", ":lua require('telescope.builtin').treesitter()<cr>")
