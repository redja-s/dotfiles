local Plugin = { "nvim-lualine/lualine.nvim" }

Plugin.dependencies = {
	"nvim-tree/nvim-web-devicons",
}

Plugin.event = "VeryLazy"

Plugin.opts = {
	options = {
		theme = "gruvbox",
		icons_enabled = true,
		component_separators = "|",
		sections_separators = "",
		disabled_filetypes = {
			statusline = { "NvimTree" },
		},
	},
}
function Plugin.config()
	local lualine = require("lualine")
	local colours = {
		blue = "#65D1FF",
		green = "#3EFFDC",
		violet = "#FF61EF",
		yellow = "#FFDA7B",
		red = "#FF4A4A",
		fg = "#c3ccdc",
		bg = "#112638",
		inactive_bg = "#2c3043",
	}

	local theme = {
		normal = {
			a = { bg = colours.blue, fg = colours.bg, gui = "bold" },
			b = { bg = colours.bg, fg = colours.fg },
			c = { bg = colours.bg, fg = colours.fg },
		},
		insert = {
			a = { bg = colours.green, fg = colours.bg, gui = "bold" },
			b = { bg = colours.bg, fg = colours.fg },
			c = { bg = colours.bg, fg = colours.fg },
		},
		visual = {
			a = { bg = colours.violet, fg = colours.bg, gui = "bold" },
			b = { bg = colours.bg, fg = colours.fg },
			c = { bg = colours.bg, fg = colours.fg },
		},
		command = {
			a = { bg = colours.yellow, fg = colours.bg, gui = "bold" },
			b = { bg = colours.bg, fg = colours.fg },
			c = { bg = colours.bg, fg = colours.fg },
		},
	}

	lualine.setup({
		options = {
			theme = theme,
		},
	})
end

function Plugin.init()
	vim.opt.showmode = false
end

return Plugin
