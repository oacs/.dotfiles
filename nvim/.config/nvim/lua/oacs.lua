require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip").filetype_extend("javascript", { "next" })
require("plugin.cmp")
require("plugin.treesitter")
-- require("copilot").setup({
-- 	suggestion = { enabled = false },
-- 	panel = { enabled = false },
-- })
--
-- require("copilot_cmp").setup({
-- 	clear_after_cursor = true,
-- })
-- local null_ls = require("null-ls")

--null_ls.setup({
--sources = {
-- null_ls.builtins.formatting.prettier,
-- null_ls.builtins.formatting.stylua,
-- null_ls.builtins.diagnostics.eslint,
-- null_ls.builtins.diagnostics.eslint_d,
-- null_ls.builtins.completion.spell,
-- null_ls.builtins.code_actions.gitsigns,
--},
--})
