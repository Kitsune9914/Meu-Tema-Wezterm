-- ███████╗██████╗ ██╗   ██╗████████╗███████╗██████╗ ███╗   ███╗
-- ██╔════╝██╔══██╗██║   ██║╚══██╔══╝██╔════╝██╔══██╗████╗ ████║
-- █████╗  ██║  ██║██║   ██║   ██║   █████╗  ██████╔╝██╔████╔██║
-- ██╔══╝  ██║  ██║██║   ██║   ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║
-- ███████╗██████╔╝╚██████╔╝   ██║   ███████╗██║  ██║██║ ╚═╝ ██║
-- ╚══════╝╚═════╝  ╚═════╝    ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝

local wezterm = require("wezterm")
act = wezterm.action

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Configuração Básica

config.color_scheme = "vulcan (base16)"
config.scrollback_lines = 3000
config.default_workspace = "home"
config.window_background_opacity = 1.0

-- Escurecer Paineis inativos

config.inactive_pane_hsb = {
	saturation = 0.50,
	brightness = 0.25,
}

-- Configuração da Fonte

config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })

-- Configuração das Teclas de atalho

config.keys = {

	-- Fechar aba e/ou paneis

	{ key = "w", mods = "SUPER|SHIFT", action = wezterm.action.CloseCurrentTab({ confirm = false }) },
	{ key = "s", mods = "SUPER|SHIFT", action = wezterm.action.CloseCurrentPane({ confirm = false }) },

	-- Ajuste e navegação nos paineis

	{ key = "k", mods = "SUPER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "j", mods = "SUPER", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "UpArrow", mods = "SHIFT", action = act.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "SHIFT", action = act.ActivatePaneDirection("Down") },
	{ key = "LeftArrow", mods = "SHIFT", action = act.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "SHIFT", action = act.ActivatePaneDirection("Right") },

	-- Ajustes do tamanho do painel

	{ key = "UpArrow", mods = "CTRL", action = act.AdjustPaneSize({ "Up", 5 }) },
	{ key = "DownArrow", mods = "CTRL", action = act.AdjustPaneSize({ "Down", 5 }) },
	{ key = "LeftArrow", mods = "CTRL", action = act.AdjustPaneSize({ "Left", 5 }) },
	{ key = "RightArrow", mods = "CTRL", action = act.AdjustPaneSize({ "Right", 5 }) },

	-- Executar comandos em uma nova Janela

	{ key = "v", mods = "SUPER|CTRL", action = wezterm.action.SpawnCommandInNewTab({
		args = { "nvim" },
	}) },

	{ key = "b", mods = "SUPER|CTRL", action = wezterm.action.SpawnCommandInNewTab({
		args = { "btop" },
	}) },
}

-- Configuração da Janela

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.window_decorations = "RESIZE"

return config
