local map = function(mode, lhf, rhf)
	vim.api.nvim_set_keymap(mode, lhf, rhf, { noremap = true })
end

map("n", "<leader>gg", ":G<CR>")
map("n", "<leader>gp", ":G push<CR>")
map("n", "<leader>gP", ":G push -f<CR>")
map("n", "<leader>gu", ":G pull<CR>")
map("n", "<leader>gk", ":Gfetch<CR>")
map("n", "<leader>gc", ":G checkout -b ")
map("n", "<leader>gn", ":diffget //3<CR>")
map("n", "<leader>go", ":diffget //2<CR>")
