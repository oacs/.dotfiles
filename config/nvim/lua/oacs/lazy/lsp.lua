local nnoremap = require("keymap").nnoremapwdesc("LSP: ")
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
	-- let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
	nnoremap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nnoremap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nnoremap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	--nnoremap("<F2>", vim.lsp.buf.rename, "[R]e[n]ame")
	nnoremap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nnoremap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
	nnoremap("<leader>td", vim.lsp.buf.type_definition, "[T]ype [D]efinition")
	nnoremap("<leader>sl", vim.diagnostic.open_float, "[S]how [L]ine diagnostic")
	nnoremap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	-- nnoremap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
	-- See `:help K` for why this keymap
	nnoremap("K", vim.lsp.buf.hover, "Hover Documentation")
	nnoremap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

	-- Lesser used LSP functionality
	nnoremap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	-- nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
	-- nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	-- nmap("<leader>wl", function()
	-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end, "[W]orkspace [L]ist Folders")

	-- Create a command `:Format` local to the LSP buffer
	--vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
	--vim.lsp.buf.format()
	--end, { desc = "Format current buffer with LSP" })
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
