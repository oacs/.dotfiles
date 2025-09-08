return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	enabled = false,

	history = true, -- keep last snippet to use it
	-- What's autosnippets?
	enable_autosnippets = true,
	-- to updote dynamic snippets on the fly
	update_events = "TextChanged,TextChangedI",

	config = function()
		local ls = require("luasnip")
		local keymap = require("keymap").keymap_with_desc("[Snip] ", { silent = true })
		-- Load snippets from folder
		require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" })

		keymap({ "i", "s" }, "<C-k>", function()
			ls.jump(1)
		end, "Jump next")
		keymap({ "i", "s" }, "<C-J>", function()
			ls.jump(-1)
		end, "Jump prev")

		keymap({ "i", "s" }, "<C-n>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end, "Chaneg active")

		-- Set up autocommand to detect Angular files
		-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
		-- 	pattern = { "*.component.ts", "*.service.ts", "*.module.ts", "*.directive.ts", "*.pipe.ts" },
		-- 	callback = function()
		-- 		vim.bo.filetype = "typescript.angular"
		-- 	end,
		-- })
	end,
}
