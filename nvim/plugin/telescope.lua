local map = function(mode, lhf, rhf)
	vim.api.nvim_set_keymap(mode, lhf, rhf, { noremap = true })
end

map("n", "<leader>ss", ":lua require('telescope.builtin').git_files()<cr>")
map("n", "<leader>sg", ":lua require('telescope.builtin').live_grep()<cr>")
map("n", "<leader>sb", ":lua require('telescope.builtin').buffers()<cr>")
map("n", "<leader>sh", ":lua require('telescope.builtin').help_tags()<cr>")
map("n", "<leader>sr", ":lua require('telescope.builtin').registers()<cr>")
-- map("n", "<leader>ft", ":lua require('custom_telescope').search_todos()<cr>")
map("n", "<leader>sq", ":lua require('telescope.builtin').quickfix()<cr>")

-- map("n", "<leader>gw", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
map("n", "<leader>gs", ":lua require('telescope.builtin').git_branches()<CR>")
map("n", "<leader>gS", ":lua require('telescope.builtin').git_stash()<CR>")

map("n", "<leader>sT", ":lua require('telescope.builtin').treesitter()<cr>")

map("v", "<leader>sg", "y<ESC>:Telescope live_grep default_text=<c-r>0<CR>")
map("n", "<leader>st", ":lua require('custom_telescope').tmux_sessions()<CR>")
