return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			delay = 500,
			icons = { mappings = true },
			spec = {
				{ "<leader>g", group = "git" },
				{ "<leader>s", group = "search" },
				{ "<leader>h", group = "harpoon" },
				{ "<leader>x", group = "trouble/diagnostics" },
				{ "<leader>d", group = "debug (DAP)" },
				{ "<leader>D", group = "database" },
				{ "<leader>r", group = "REST / rename" },
				{ "<leader>t", group = "tmux" },
			},
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = { check_ts = true },
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
	{
		"brenoprata10/nvim-highlight-colors",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			render = "background",
			enable_tailwind = true,
		},
	},
}
