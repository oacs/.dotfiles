local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp_servers = { "tsserver", "vimls", "vuels", "gopls" }
for _, server in ipairs(lsp_servers) do
	require("lspconfig")[server].setup({ capabilities = capabilities })
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = "/home/oacs/local/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

require("lspconfig").sumneko_lua.setup({
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
	settings = {
		Lua = {
			capabilities = capabilities,
			runtime = {
				version = "LuaJIT",
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				globals = { "vim", "table", "package", "ipairs" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

-- TODO move this to a map file for lsp
local map = function(mode, lhf, rhf)
	vim.api.nvim_set_keymap(mode, lhf, rhf, { noremap = true })
end

-- set completeopt=menuone,noselect
-- let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
map("n", "<leader>cd", ":lua vim.lsp.buf.definition()<CR>")
map("n", "<leader>cr", ":lua vim.lsp.buf.references()<CR>")
map("n", "<leader>ci", ':lua require("telescope.builtin").lsp_implementations()<cr>')
map("n", "<leader>ch", ":lua vim.lsp.buf.hover()<CR>")
map("n", "<leader>cs", ":lua vim.lsp.buf.signature_help()<CR>")
map("n", "<leader>cf", ":lua vim.diagnostic.open_float()<CR>")
map("n", "<leader>cl", ':lua require("telescope.builtin").lsp_document_diagnostics()<cr>')

map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<cr>")

map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
map("n", "<leader>cn", ":lua vim.lsp.diagnostic.goto_next()<CR>")
