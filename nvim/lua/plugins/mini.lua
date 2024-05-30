local Plugin = { "echasnovski/mini.nvim" }

Plugin.version = false

function Plugin.init()
  require("mini.bufremove").setup()
  require("mini.indentscope").setup()

  vim.keymap.set("n", "<S-x>", require("mini.bufremove").delete, { desc = "Delete buffer (mini)" })
end

return Plugin
