local cmd = vim.cmd
return {
	{
		"catppuccin/nvim",
		name = "catppuccin-nvim",
		priority = 1000,
		dependencies = { "nvim-lualine/lualine.nvim" },
		config = function()
			-- load the colorscheme here
			-- set color scheme
			-- silent to avoid error if theme is missing
			cmd([[silent! colorscheme catppuccin]])
		end,
	},
	{
		enabled = true,
		"nvim-lualine/lualine.nvim", -- Fancier statusline
		config = function()
			-- local CodeGPTModule = require("codegpt")
			require("lualine").setup({
				options = {
					-- theme = "tokyonight",
					theme = "catppuccin-nvim",
				},
				extensions = {
					"fugitive",
					"lazy",
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "filename", "FugitiveHead" },
					lualine_c = { "diff", "diagnostics" },
					-- lualine_x = { CodeGPTModule.get_status, "encoding" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
			})
		end,
	},
}
