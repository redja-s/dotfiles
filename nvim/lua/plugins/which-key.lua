local Plugin = { "folke/which-key.nvim" }

Plugin.event = "VeryLazy"

function Plugin.init()
  vim.o.timeout = true
  vim.o.timeoutlen = 300
  require("which-key").setup({})
end

return Plugin
