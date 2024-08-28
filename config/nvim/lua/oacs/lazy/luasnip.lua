return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	history = true, -- keep last snippet to use it

	-- What's autosnippets?
	enable_autosnippets = true,

	-- to updote dynamic snippets on the fly
	update_events = "TextChanged,TextChangedI",

	config = function()
		local ls = require("luasnip")

		-- Load snippets from folder
		require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" })

		-- Set up autocommand to detect Angular files
		vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
			pattern = { "*.component.ts", "*.service.ts", "*.module.ts", "*.directive.ts", "*.pipe.ts" },
			callback = function()
				vim.bo.filetype = "typescript.angular"
			end,
		})
		local inoremap = require("keymap").inoremap
		local snoremap = require("keymap").snoremap

		vim.keymap.set({ "i", "s" }, "<C-k>", function()
			ls.jump(1)
		end, { silent = true })
		vim.keymap.set({ "i", "s" }, "<C-J>", function()
			ls.jump(-1)
		end, { silent = true })

		vim.keymap.set({ "i", "s" }, "<C-n>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end, { silent = true })
	end,
	-- 	dependencies = {
	-- 		"rafamadriz/friendly-snippets",
	-- 	},kk
}

-- {
-- 	config = function()
-- 		require("luasnip.loaders.from_vscode").lazy_load()
-- 		require("luasnip").filetype_extend("javascript", { "next" })
-- 	end,
-- },
