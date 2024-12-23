local Plugin = { "folke/which-key.nvim" }

Plugin.event = "VeryLazy"
-- Plugin.keys = {
--   {
--     "<leader>",
--     function()
--       require("which-key").show({ global = false })
--     end,
--     desc = "Buffer Local Keymaps",
--   },
-- }

function Plugin.init()
  vim.o.timeout = true
  vim.o.timeoutlen = 300
  require("which-key").setup({})
end

return Plugin
