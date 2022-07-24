vim.cmd([[packadd packer.nvim]])

-- use space as a the leader key
vim.g.mapleader = " "

vim.o.syntax = true

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*.lua", "*.sh", "*.ts", "*.vue" },
	command = "Neoformat",
})
-- set color scheme
-- silent to avoid error if theme is missing
vim.cmd("silent! colorscheme gruvbox-material")
local status, _ = pcall(require, "oacs")
if status then
	--lfs exists, so use it.
	require("tmux")
end
return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Post-install/update hook with neovim command
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	-- You can alias plugin names
	-- use({ "dracula/vim", as = "dracula" })
	use({ "sainnhe/gruvbox-material" })
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	use({ "nvim-lua/plenary.nvim" })
	use({ "ThePrimeagen/harpoon" })
	use({ "nvim-telescope/telescope.nvim" })
	use({ "nvim-telescope/telescope-fzy-native.nvim" })

	-- Plebvim lsp Plugins
	use({ "neovim/nvim-lspconfig" })

	-- Complete
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "onsails/lspkind-nvim" })
	use({ "kristijanhusak/vim-dadbod-completion" })

	use({
		"simrat39/symbols-outline.nvim",
		config = function()
			local opts = {
				-- whether to highlight the currently hovered symbol
				-- disable if your cpu usage is higher than you want it
				highlight_hovered_item = true,
				-- whether to show outline guides
				show_guides = true,
			}
			require("symbols-outline").setup(opts)
		end,
	})

	use({ "L3MON4D3/LuaSnip" })
	use({ "saadparwaiz1/cmp_luasnip" })
	-- updating the parsers on update
	use({ "nvim-treesitter/playground" })
	-- Git
	use({ "tpope/vim-fugitive" })
	use({ "moll/vim-bbye" })
	use({ "aymericbeaumet/vim-symlink" })
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
	use({ "akinsho/toggleterm.nvim" })

	use({ "vimwiki/vimwiki" })
	use({ "junegunn/fzf" })
	use({ "junegunn/fzf.vim" })
	use({ "michal-h21/vim-zettel" })

	-- debugger
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
end)
