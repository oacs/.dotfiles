require("lualine").setup({
	options = {
		theme = "tokyonight",
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "filename" },
		lualine_c = { "diff", "diagnostics" },
		lualine_x = { "encoding" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
