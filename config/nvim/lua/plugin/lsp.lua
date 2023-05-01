-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
	-- In this case, we create a function that lets us more easily define mappings specific
	-- for LSP related items. It sets the mode, buffer and description for us each time.
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	-- let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	--nmap("<F2>", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
	nmap("<leader>td", vim.lsp.buf.type_definition, "[T]ype [D]efinition")
	nmap("<leader>sl", vim.diagnostic.open_float, "[S]how [L]ine diagnostic")
	nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
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
	tsserver = {},
	--lua_ls === lua_language_server
	lua_ls = {},
}
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

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
