local Plugin = { "ellisonleao/glow.nvim" }

Plugin.config = true
Plugin.cmd = "Glow"

function Plugin.config()
  require("glow").setup({
    style = "dark",

    vim.keymap.set("n", "<leader>G", "<Cmd>Glow", "Open Markdown preview"),
  })
end

return Plugin
