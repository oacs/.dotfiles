local nnoremap = require("keymap").nnoremapwdesc("Git :")
-- local vnoremap = require("keymap").vnoremap

return {
	-- Git
	{
		"tpope/vim-fugitive",
		config = function()
			-- Git mappings
			nnoremap("<leader>gg", ":G<CR>", "[GG]it center")
			nnoremap("<leader>g<leader>", ":G ", "[G]it ")
			nnoremap("<leader>gp", ":G push<CR>", "[G]it [P]ush")
			nnoremap("<leader>ga", ":G write<CR>", "[G]it [A]dd")
			nnoremap("<leader>gr", ":G read<CR>", "[G]it [R]estore")
			nnoremap("<leader>gc", ":G commit<CR>", "[G]it [C]ommit")
			nnoremap("<leader>gP", ":G push -f<CR>", "[G]it [P]ush force")
			nnoremap("<leader>gu", ":G pull<CR>", "[G]it [U]pdate (pull)")
			nnoremap("<leader>gf", ":G fetch<CR>", "[G]it [F]etch")
			nnoremap("<leader>gb", ":G checkout -b ", "[G]it Checkout [B]ranch")
			nnoremap("<leader>gn", ":diffget //3<CR>", "[G]it grab head")
			nnoremap("<leader>go", ":diffget //2<CR>", "[G]it grab incoming")
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
			})
		end,
	},
}
