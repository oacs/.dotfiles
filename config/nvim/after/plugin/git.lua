local nnoremap = require("keymap").nnoremap
-- local vnoremap = require("keymap").vnoremap

local desc = function(desc)
	if desc then
		desc = "Git: " .. desc
	end
	return { desc = desc }
end

-- Git mappings
nnoremap("<leader>gg", ":G<CR>", desc("[GG]it center"))
nnoremap("<leader>gp", ":G push<CR>", desc("[G]it [P]ush"))
nnoremap("<leader>ga", ":Gwrite<CR>", desc("[G]it [A]dd"))
nnoremap("<leader>gr", ":Gread<CR>", desc("[G]it [R]estore"))
nnoremap("<leader>gc", ":G commit<CR>", desc("[G]it [C]ommit"))
nnoremap("<leader>gP", ":G push -f<CR>", desc("[G]it [P]ush force"))
nnoremap("<leader>gu", ":G pull<CR>", desc("[G]it [U]pdate (pull)"))
nnoremap("<leader>gf", ":Gfetch<CR>", desc("[G]it [F]etch"))
nnoremap("<leader>gb", ":G checkout -b ", desc("[G]it Checkout [B]ranch"))
nnoremap("<leader>gn", ":diffget //3<CR>", desc("[G]it grab head"))
nnoremap("<leader>go", ":diffget //2<CR>", desc("[G]it grab incoming"))
