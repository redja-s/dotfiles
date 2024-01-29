local Plugin = { "nvim-tree/nvim-tree.lua" }

Plugin.version = "*"
Plugin.lazy = false
Plugin.dependencies = {
  "nvim-tree/nvim-web-devicons"
}

function Plugin.config()
  require("nvim-tree").setup {}
end

function Plugin.init()
  vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NvimTree" })
  vim.keymap.set("n", "<leader>tc", "<cmd>NvimTreeCollapse<cr>", { desc = "Collapse NvimTree recursively" })
  vim.keymap.set("n", "<leader>tf", "<cmd>NvimTreeFindFile<cr>", { desc = "Select current buffer in tree" })
end

return Plugin
