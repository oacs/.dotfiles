vim.cmd([[packadd packer.nvim]])
-- use space as a the leader key
vim.g.mapleader = " "

vim.o.syntax = true

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*.lua", "*.sh", "*.ts", "*.vue", "*.json", "*.tsx", "*.js", "*.html" },
	command = "Neoformat",
})
-- set color scheme
-- silent to avoid error if theme is missing
vim.cmd("silent! colorscheme tokyonight-moon")

-- local _, _ = pcall(require, "oacs")
require("oacs")

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- You can alias plugin names
	-- use({ "dracula/vim", as = "dracula" })
	use({ "sainnhe/gruvbox-material" })
	use("folke/tokyonight.nvim")

	-- Plebvim lsp Plugins
	use({ "neovim/nvim-lspconfig" })

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-telescope/telescope-ui-select.nvim" })

	-- Harpoon quick terminal jumps
	use("ThePrimeagen/harpoon")

	-- Git
	use({ "tpope/vim-fugitive" })

	-- Prettier
	use({ "sbdchd/neoformat" })

	-- Coment
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- Delete ( ) [ ] { } without inner content
	use({ "kylechui/nvim-surround" })

	-- prisma '
	use("pantharshit00/vim-prisma")
	use("j-hui/fidget.nvim")

	-- CMP
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("onsails/lspkind.nvim")
	use("nvim-tree/nvim-web-devicons")
	use("jcha0713/cmp-tw2css")

	-- Snippets
	use({ "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" })
	use("rafamadriz/friendly-snippets")

	-- Copilot
	-- use("github/copilot.vim")
	use("zbirenbaum/copilot.lua", {})

	use("zbirenbaum/copilot-cmp", {})

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	--	use("/home/oacs/dev/rocket")

	-- Add yanky to copy to system clipboard
	use("gbprod/yanky.nvim")
end)
