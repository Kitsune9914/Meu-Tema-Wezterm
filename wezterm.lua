local wezterm = require("wezterm")
act = wezterm.action

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Configuração Básica

config.color_scheme = "Tokyo Night"
config.scrollback_lines = 3000
config.default_workspace = "home"
config.window_background_opacity = 0.7

-- Configuração da Fonte

config.font = wezterm.font("JetBrains Mono")

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
