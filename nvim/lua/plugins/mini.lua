local Plugin = { "echasnovski/mini.nvim" }

Plugin.version = false

function Plugin.init()
  require("mini.bufremove").setup()
  require("mini.indentscope").setup()

  vim.keymap.set("n", "<c-x>", require("mini.bufremove").delete, { desc = "Delete buffer (mini)" })
end

return Plugin
