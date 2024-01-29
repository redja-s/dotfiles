local Plugin = { "kylechui/nvim-surround" }

Plugin.version = "*"
Plugin.event = "VeryLazy"

function Plugin.config()
  require("nvim-surround").setup({})
end

return Plugin
