--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
	-- let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
	require("oacs.maps.maps").add_lsp_maps()
	require("oacs.maps.maps").add_dap_maps()
end

-- Enable the following language servers
local servers = {
	--gopls = {},
	--rust_analyzer = {},
	angularls = {},
	ts_ls = {},
	lua_ls = {},
}

return { -- LSP Configuration & Plugins
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Automatically install LSPs to stdpath for neovim
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"mfussenegger/nvim-dap",
		"jay-babu/mason-nvim-dap.nvim",
		-- Useful status updates for LSP
		"j-hui/fidget.nvim",

		-- Additional lua configuration, makes nvim stuff amazing
		"folke/neodev.nvim",

		{
			"folke/neoconf.nvim",
			cmd = "Neoconf",
		},
		"nvimtools/none-ls.nvim",

		-- DAP UI
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		require("neodev").setup()
		require("fidget").setup({})
		require("neoconf").setup({})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

		-- Setup mason so it can manage external tooling
		local isMasonInstaled, mason = pcall(require, "mason")
		if isMasonInstaled then
			mason.setup()
		end

		-- Dap config
		require("mason-nvim-dap").setup({
			ensure_installed = { "node2", "chrome", "js" },
			automatic_setup = true,
			handlers = {
				function(config)
					-- all sources with no handler get passed here
					-- Keep original functionality
					require("mason-nvim-dap").default_setup(config)
				end,
			},
		})

		-- DAP UI setup
		local dap, dapui = require("dap"), require("dapui")
		dapui.setup()

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		-- Ensure the servers above are installed
		local mason_lspconfig = require("mason-lspconfig")

		mason_lspconfig.setup({})

		vim.lsp.config("*", {
			on_attach = on_attach,
		})
	end,
}
