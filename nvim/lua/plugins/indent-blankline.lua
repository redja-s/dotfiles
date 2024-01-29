local Plugin = { "lukas-reineke/indent-blankline.nvim" }

Plugin.main = "ibl"
Plugin.event = { "BufReadPost", "BufNewFile" }

Plugin.opts = {
  enabled = true,
  scope = {
    enabled = false,
  },
  indent = {
    char = "|",
    tab_char = "|",
  },
}

return Plugin
