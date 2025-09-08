-- CMP
return { -- Autocompletion
	"hrsh7th/nvim-cmp",
	alias = "cmp",
	-- load cmp on InsertEnter
	event = "InsertEnter",
	dependencies = {
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
	},

	config = function()
		-- Set up nvim-cmp.
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		-- local luasnip = require("luasnip")

		-- To make LSP notifications look like vscode
		lspkind.init()

		-- require("luasnip.loaders.from_vscode").lazy_load()

		local has_words_before = function()
			if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
				return false
			end
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
		end

		local buffer_cmp_config = {
			name = "buffer",
			option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end,
			},
		}

		local confirm_with_snippets = cmp.mapping(function(fallback)
			if cmp.visible() then
				-- if luasnip.expandable() then
				-- 	luasnip.expand()
				-- else
				cmp.confirm({
					select = true,
				})
				-- end
			else
				fallback()
			end
		end)

		cmp.setup({
			formatting = {
				format = lspkind.cmp_format({
					with_text = true,
					menu = {
						buffer = "[buf]",
						-- copilot = "[cop]",
						-- luasnip = "[snip]",
						nvim_lsp = "[LSP]",
						nvim_lua = "[api]",
						path = "[path]",
					},
					mode = "symbol", -- show only symbol annotations
					maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
					ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

					-- The function below will be called before any actual modifications from lspkind
					-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
					before = function(_, vim_item)
						return vim_item
					end,
				}),
			},
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					-- require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			sorting = {
				priority_weight = 2,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<c-p>"] = vim.schedule_wrap(function(fallback)
					if cmp.visible() and has_words_before() then
						cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
					else
						fallback()
					end
				end),
				["<c-n>"] = vim.schedule_wrap(function(fallback)
					if cmp.visible() and has_words_before() then
						cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
					else
						fallback()
					end
				end),
				["<Tab>"] = vim.schedule_wrap(function(fallback)
					if cmp.visible() and has_words_before() then
						cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
					-- elseif luasnip.locally_jumpable(1) then
					-- 	luasnip.jump(1)
					else
						fallback()
					end
				end),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					-- elseif luasnip.locally_jumpable(-1) then
					-- 	luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<C-f>"] = confirm_with_snippets,
				["<CR>"] = confirm_with_snippets,

				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				-- ["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-c>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
			}),
			sources = cmp.config.sources({
				{ name = "supermaven" },
				{ name = "neorg" },
				-- { name = "luasnip" },
				{ name = "cmp-tw2css" },
				{ name = "nvim_lsp" },
				{ name = "path" },
			}, {
				buffer_cmp_config,
			}),
		})
		-- Set configuration for specific filetype.
		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
				buffer_cmp_config,
			}, {}),
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				buffer_cmp_config,
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})

		-- vim.cmd([[
		--         augroup DadBodSql
		--                 autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
		--         augroup END
		-- ]]
		--
	end,
}
