local cmd = vim.cmd
return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
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
					theme = "catppuccin",
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

-- Folke supremacy
-- {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
-- 	priority = 1000, -- make sure to load this before all the other start plugins
-- 	config = function()
-- 		-- load the colorscheme here
-- 		-- set color scheme
-- 		-- silent to avoid error if theme is missing
-- 		vim.cmd([[silent! colorscheme tokyonight]])
-- 	end,
-- },
