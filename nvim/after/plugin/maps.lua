local map = function(mode, lhf, rhf)
	vim.api.nvim_set_keymap(mode, lhf, rhf, { noremap = true })
end

map("n", "<Leader>q", ":q<CR>")
map("n", "<Leader>w", ":w<CR>")
map("n", "<Leader>p", "<C-w>")
map("n", "<Leader>cp", ":let @* =', 'expand(\"%\")<CR>")
map("n", "<Leader>bp", ":bp<CR>")
map("n", "<Leader>bb", ":buffers<CR>")
map("n", "<Leader>bd", ":bd<CR>")
map("n", "<Leader>bw", ":bw<CR>")
map("n", "<Leader>bn", ":bn<CR>")
map("n", "<Leader>l", ":bn<CR>")
map("n", "<Leader>e", ":Explore<CR>")
map("t", "<Esc>", "<C-\\><C-n>")
map("v", "//", "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>")
map("x", "<leader>p", '"_dP')
map("n", "<F5>", ":UndotreeToggle<CR>")
-- map <C-L> (redraw screen) to also turn off search highlighting until the
-- next search
map("n", "<C-L>", ":nohl<CR><C-L>")
-- Don't use arrow keys
--[[ map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>") ]]
-- Easy quick of insert mode
map("i", "jj", "<Esc>")

-- map("", "<Leader>e", "<cmd>lua require('lf').start()<CR>")

-- greatest remap ever
map("x", "<leader>p", '"_dP')

-- next greatest remap ever : asbjornHaland
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>Y", 'gg"+yG')

map("n", "<leader>d", '"_d')
map("v", "<leader>d", '"_d')

map("n", "<Leader>o", ":SymbolsOutline<CR>")
