-- Used for search and replace
local Plugin = { "nvim-pack/nvim-spectre" }

Plugin.dependencies = {
  "nvim-lua/plenary.nvim",
}

function Plugin.init()
  vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<cr>', { desc = "Toggle Spectre" })
  vim.keymap.set(
    "n",
    "<leader>sw",
    '<cmd>lua require("spectre").open_visual({select_word=true})<cr>',
    { desc = "Search current word" }
  )
  vim.keymap.set(
    "v",
    "<leader>sw",
    '<esc><cmd>lua require("spectre").open_visual()<cr>',
    { desc = "Search current word" }
  )
  vim.keymap.set(
    "n",
    "<leader>sp",
    '<cmd>lua require("spectre").open_file_search({select_word=true})<cr>',
    { desc = "Search on current file" }
  )
end

return Plugin
