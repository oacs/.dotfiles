vim.cmd([[packadd packer.nvim]])

-- use space as a the leader key
vim.g.mapleader = " "

-- set color scheme
vim.o.syntax = true
vim.cmd("colorscheme dracula")

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*.lua", "*.sh", "*.ts", "*.vue" },
	command = "undojoin | Neoformat",
})

require("oacs")
require("tmux")

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Post-install/update hook with neovim command
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	-- You can alias plugin names
	use({ "dracula/vim", as = "dracula" })

	use({ "nvim-lua/plenary.nvim" })
	use({ "ThePrimeagen/harpoon" })
	use({ "nvim-telescope/telescope.nvim" })
	use({ "nvim-telescope/telescope-fzy-native.nvim" })

	-- Plebvim lsp Plugins
	use({ "neovim/nvim-lspconfig" })

	-- Complete
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "onsails/lspkind-nvim" })

	-- Install snippet engine (This example installs [hrsh7th/vim-vsnip](https://github.com/hrsh7th/vim-vsnip))
	-- For vsnip user.
	use({ "hrsh7th/cmp-vsnip" })
	use({ "hrsh7th/vim-vsnip" })

	-- Install the buffer completion source
	use({ "glepnir/lspsaga.nvim" })
	use({ "simrat39/symbols-outline.nvim" })

	-- updating the parsers on update
	use({ "nvim-treesitter/playground" })
	-- Git
	use({ "tpope/vim-fugitive" })

	-- Prettier
	use({ "sbdchd/neoformat" })
	-- Delete ( ) [ ] { } without inner content
	use({ "tpope/vim-surround" })
	use({ "tpope/vim-dadbod" })
	use({ "kristijanhusak/vim-dadbod-ui" })
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	})
	use({ "lmburns/lf.nvim" })
	use({ "akinsho/toggleterm.nvim" })
end)
