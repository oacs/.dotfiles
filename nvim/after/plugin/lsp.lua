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

local nnoremap = require("keymap").nnoremap

-- set completeopt=menuone,noselect
-- let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
nnoremap("<leader>cd", ":lua vim.lsp.buf.definition()<CR>")
nnoremap("<leader>cr", ":lua vim.lsp.buf.references()<CR>")
nnoremap("<leader>ci", ':lua require("telescope.builtin").lsp_implementations()<cr>')
nnoremap("<leader>ch", ":lua vim.lsp.buf.hover()<CR>")
nnoremap("<leader>cs", ":lua vim.lsp.buf.signature_help()<CR>")
nnoremap("<leader>cf", ":lua vim.diagnostic.open_float()<CR>")
nnoremap("<leader>cl", ':lua require("telescope.builtin").lsp_document_diagnostics()<cr>')

nnoremap("<leader>ca", ":lua vim.lsp.buf.code_action()<cr>")

nnoremap("<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
nnoremap("<leader>cn", ":lua vim.lsp.diagnostic.goto_next()<CR>")
