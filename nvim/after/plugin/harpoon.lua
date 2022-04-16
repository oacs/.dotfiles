local map = function(mode, lhf, rhf)
	vim.api.nvim_set_keymap(mode, lhf, rhf, { noremap = true })
end
-- Terminal commands
map("n", "<leader>tj", ':lua require("harpoon.term").gotoTerminal(1)<CR>')
map("n", "<leader>tk", ':lua require("harpoon.term").gotoTerminal(2)<CR>')
map("n", "<leader>tm", ':lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>')
map("n", "<leader>tn", ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
map("n", "<leader>ta", ':lua require("harpoon.mark").add_file()<CR>')
map("n", "<leader>tl", ':lua require("harpoon.term").sendCommand(1, 1)<CR>')
