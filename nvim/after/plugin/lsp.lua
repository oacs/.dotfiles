local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lspkind = require("lspkind")
lspkind.init()

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
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			-- For `vsnip` user.
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
		end,
	},
	mapping = {
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = {
		{ name = "nvim_lua" },
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "buffer", keyword_length = 5 },
	},
	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			menu = {
				buffer = "[buf]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[api]",
				path = "[path]",
				luasnip = "[snip]",
			},
		}),
	},
})

local map = function(mode, lhf, rhf)
	vim.api.nvim_set_keymap(mode, lhf, rhf, { noremap = true })
end

-- set completeopt=menuone,noselect
-- let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
map("n", "<leader>sd", ":lua vim.lsp.buf.definition()<CR>")
map("n", "<leader>sr", ":lua vim.lsp.buf.references()<CR>")
map("n", "<leader>si", ':lua require("telescope.builtin").lsp_implementations()<cr>')
map("n", "<leader>sh", ":lua vim.lsp.buf.hover()<CR>")
map("n", "<leader>ss", ":lua vim.lsp.buf.signature_help()<CR>")
map("n", "<leader>sl", ":lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
map("n", "<leader>sf", ':lua require("telescope.builtin").lsp_document_diagnostics()<cr>')

map("n", "<leader>ca", ':lua require("telescope.builtin").lsp_code_actions()<cr>')

map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
map("n", "<leader>gn", ":lua vim.lsp.diagnostic.goto_next()<CR>")