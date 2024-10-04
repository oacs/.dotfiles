local nnoremap = require("keymap").nnoremapwdesc("Git :")
-- local vnoremap = require("keymap").vnoremap

return {
	-- Git
	{
		"tpope/vim-fugitive",
		config = function()
			-- Git mappings
			require("oacs.maps.maps").add_git_maps()
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
