--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
	-- let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
	require("oacs.maps.maps").add_lsp_maps()
end

-- Enable the following language servers
local servers = {
	--gopls = {},
	--emmet_ls = {},
	--rust_analyzer = {},
	-- prismals === prisma-language-server
	-- prismals = {},
	-- volar === vue-language-server
	--volar = {},
	-- tailwindcss === tailwindcss-language-server
	-- tailwindcss = {},
	-- tsserver === typescript-language-server
	angularls = {},
	-- tsserver = {},
	ts_ls = {},
	--lua_ls === lua_language_server
	lua_ls = {},
}
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
return { -- LSP Configuration & Plugins
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Automatically install LSPs to stdpath for neovim
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		-- Useful status updates for LSP
		"j-hui/fidget.nvim",

		-- Additional lua configuration, makes nvim stuff amazing
		"folke/neodev.nvim",

		{
			"folke/neoconf.nvim",
			cmd = "Neoconf",
		},
		"nvimtools/none-ls.nvim",
	},
	config = function()
		require("neodev").setup()
		require("fidget").setup({
			-- spinner = "moon",
		})
		require("neoconf").setup({})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
		require("lspconfig").gdscript.setup({
			capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		})
		-- Setup mason so it can manage external tooling
		local isMasonInstaled, mason = pcall(require, "mason")
		if isMasonInstaled then
			mason.setup()
		end
		-- Dap config
		-- require("mason-nvim-dap").setup({
		-- ensure_installed = { "node2", "chrome", "js" },
		-- automatic_setup = true,
		-- })
		-- require("mason-nvim-dap").setup_handlers({})

		-- Ensure the servers above are installed
		local mason_lspconfig = require("mason-lspconfig")

		--if isLspMasonConfigInstalled then
		mason_lspconfig.setup({
			ensure_installed = vim.tbl_keys(servers),
		})

		mason_lspconfig.setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
					on_attach = on_attach,
					settings = servers[server_name],
				})
			end,
		})
		-- local null_ls = require("null-ls")
		--
		-- null_ls.setup({
		-- 	sources = {
		-- 		null_ls.builtins.formatting.stylua,
		-- 		null_ls.builtins.diagnostics.eslint,
		-- 		null_ls.builtins.completion.spell,
		-- 	},
		-- })
	end,
}
