-- Prettier
local g = vim.g

return {
	"sbdchd/neoformat",
	config = function()
		-- g.neoformat_enabled_vue = { "prettierd", "eslint_d" }
		-- g.neoformat_enabled_javascript = { "prettierd", "eslint_d" }
		g.neoformat_run_all_formatters = 1
		g.neoformat_enabled_typescript = { "eslint_d", "prettier" }
		g.neoformat_enabled_html = { "prettier", "eslint_d" }
		g.neoformat_enabled_less = { "prettier" }
		-- g.neoformat_enabled_json = { "prettierd" }
		-- g.neoformat_enabled_go = { "gofmt" }
		g.neoformat_enabled_lua = { "stylua" }
		-- g.neoformat_enabled_vim = { "prettier" }
		-- g.neoformat_enabled_prisma = { "prettier" }
		-- g.neoformat_enabled_shell = { "shmft", "prettierd" }
		-- g.neoformat_enabled_sh = { "shmft", "prettierd" }
		-- g.neoformat_run_all_formatters = 1
		-- g.shfmt_opt = "ci"
		-- g.neoformat_basic_format_align = 1
		-- g.neoformat_basic_format_retab = 1
		-- g.neoformat_basic_format_trim = 1

		vim.api.nvim_create_autocmd({ "BufWritePre" }, {
			pattern = {
				"*.lua",
			},
			command = "Neoformat stylua",
		})
		vim.api.nvim_create_autocmd({ "BufWritePre" }, {
			pattern = {
				"*.ts",
				"*.vue",
				"*.json",
				"*.gd",
				"*.tsx",
				"*.js",
				"*.jsx",
				"*.css",
				"*.scss",
				"*.sass",
				"*.less",
				"*.html",
			},
			command = "Neoformat",
		})
	end,
}
