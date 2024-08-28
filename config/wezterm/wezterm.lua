local wezterm = require("wezterm")

-- local tmux = {}
-- if wezterm.target_triple == "aarch64-apple-darwin" then
-- 	tmux = { "/opt/homebrew/bin/tmux", "new", "-As0" }
-- else
-- 	tmux = { "tmux" }
-- end

return {
	color_scheme = "Catppuccin Mocha", -- or Macchiato, Frappe, Latte
	-- default_prog = tmux,
	hide_tab_bar_if_only_one_tab = true,
	-- font = wezterm.font("NotoMono Nerd Font Propo", {stretch: "Expanded"}),
	font = wezterm.font("JetBrains Mono", { stretch = "UltraExpanded", weight = "Regular" }),
}
