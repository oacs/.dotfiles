local nnoremap = require("keymap").nnoremapwdesc("[X]Trouble :")

return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
		nnoremap("<leader>xx", function()
			require("trouble").toggle()
		end, "[X][X] Trouble")
		nnoremap("<leader>xw", function()
			require("trouble").toggle("workspace_diagnostics")
		end, "[W]orkspace diagnostics")
		nnoremap("<leader>xd", function()
			require("trouble").toggle("document_diagnostics")
		end, "[D]ocument [D]iagnostics")
		nnoremap("<leader>xq", function()
			require("trouble").toggle("quickfix")
		end, "[Q]uickfix")
		nnoremap("<leader>xl", function()
			require("trouble").toggle("loclist")
		end, "[L]oclist")
		nnoremap("gR", function()
			require("trouble").toggle("lsp_references")
		end, "[g]o to [R]eferences")
		nnoremap("<leader>xn", function()
			require("trouble").toggle("lsp_references")
		end, "[g]o to [R]eferences")
		nnoremap("<leader>xp", function()
			require("trouble").toggle("lsp_references")
		end, "[g]o to [R]eferences")
		nnoremap("<leader>xn", function()
			-- jump to the next item, skipping the groups
			require("trouble").next({ skip_groups = true, jump = true })
		end, "[N]ext")

		nnoremap("<leader>xp", function()
			-- jump to the previous item, skipping the groups
			require("trouble").previous({ skip_groups = true, jump = true })
		end, "[P]revious")

		nnoremap("<leader>x0", function()
			-- jump to the first item, skipping the groups
			require("trouble").first({ skip_groups = true, jump = true })
		end, "[0]First")

		nnoremap("<leader>xp", function()
			-- jump to the last item, skipping the groups
			require("trouble").last({ skip_groups = true, jump = true })
		end, "[$]Last")
	end,
}
