local Plugin = { "nvim-lualine/lualine.nvim" }

Plugin.event = "VeryLazy"

Plugin.opts = {
  options = {
    theme = "gruvbox",
    icons_enabled = true,
    component_separators = "|",
    sections_separators = "",
    disabled_filetypes = {
      statusline = { "NvimTree" }
    }
  },
}

function Plugin.init()
  vim.opt.showmode = false
end

return Plugin
