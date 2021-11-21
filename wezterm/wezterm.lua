local wezterm = require 'wezterm';
return {
         font_dirs = {"/usr/share/fonts/OTF", "~/.fonts"},
        font = wezterm.font_with_fallback({
    "PowerlineSymbols",
  }),
  font_size = 16.0,
  color_scheme = "Brogrammer",
  default_prog = {"/usr/bin/zsh"},
  window_background_opacity = 0.8,
  warn_about_missing_glyphs = false
}
