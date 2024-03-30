local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

-- If the width of the window is too small, hide some components of the lualine
local hide_in_width = function()
	return vim.fn.winwidth(0) > 60
end

-- GIT --
local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local diff = {
	"diff",
	colored = true,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
}

-- Copilot --
local copilot = {
	"copilot",
	show_colors = true,
}

-- Other --
local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = true,
	update_in_insert = false,
	always_visible = true,
}

local filetype = {
	"filetype",
	colored = true,
	icons_enabled = true,
	icon = { align = "right" },
}

-- Filepath --
local filepath = {
	"filename",
	path = 1,
	file_status = false,
	color = "lualine_c_normal",
	cond = hide_in_width,
	max_length = vim.o.columns / 3,
}

-- Buffers --
local buffers = {
	"buffers",
	icons_enabled = true,
	icon = { "filetype", colored = true, icon_only = true },
	show_modified_status = true,
	colored = true,
	use_mode_colors = false,
	buffers_color = {
		active = "TabLineSel", -- Color for active buffer.
		inactive = "TabLine", -- Color for inactive buffer.
	},
	symbols = {
		modified = " ●",
		alternate_file = "",
		directory = "",
	},
	max_length = vim.o.columns * 2 / 3,
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			"alpha",
			"dashboard",
			"NvimTree",
			"Outline",
			winbar = { "help", "packer", "Trouble", "Outline", "toggleterm" },
		},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { diagnostics, branch },
		lualine_c = { copilot },
		lualine_x = {},
		lualine_y = { diff, "encoding", filetype },
		lualine_z = { "location", { "progress", cond = hide_in_width } },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {
		lualine_a = { filepath },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { buffers },
	},
	inactive_winbar = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { buffers },
	},
	extensions = {},
})
