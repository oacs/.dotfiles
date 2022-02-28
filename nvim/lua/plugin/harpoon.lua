require("harpoon").setup({
	global_settings = {
		save_on_toggle = false,
		save_on_change = true,
	},
	projects = {
		-- Yes $HOME works
		["$HOME/dev/adtal"] = {
			term = {
				cmds = {
					"./frontend && npm start",
					"./backend && npm run start:ubuntu",
				},
			},
		},
		["$HOME/dev/front"] = {
			term = {
				cmds = {
					"npm run dev:broker:local",
				},
			},
		},
		["$HOME/dev/back"] = {
			term = {
				cmds = {
					"npm run start",
					"npm run validate && npm run lint-fix",
				},
			},
		},
	},
})
