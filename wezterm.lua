local wezterm = require("wezterm")
act = wezterm.action

-- Configuração Básica

config.color_scheme = "Catppuccin Frappe"
config.scrollback_lines = 3000
config.default_workspace = "home"
config.window_background_opacity = 0.7

-- Configuração da Fonte

config.font = wezterm.font("JetBrains Mono", { weight = "Bold", italic = true })

-- Configuração das Teclas de atalho

config.keys =
	{ { key = "k", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) } }

-- Configuração da Janela

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.window_decorations = "RESIZE"

return config
