local Plugin = { "nvim-tree/nvim-tree.lua" }

Plugin.version = "*"
Plugin.lazy = false
Plugin.dependencies = {
  "nvim-tree/nvim-web-devicons",
}

function Plugin.config()
  local nvimtree = require("nvim-tree")

  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  nvimtree.setup({
    view = {
      width = 35,
      relativenumber = true,
    },
    renderer = {
      group_empty = true,
      -- indent_markers = {
      --   enable = true,
      -- },
      icons = {
        glyphs = {
          folder = {
            arrow_closed = "",
            arrow_open = "",
          },
        },
      },
    },
    actions = {
      open_file = {
        window_picker = {
          enable = false,
        },
      },
    },
    git = {
      ignore = false,
    },
  })

  vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Open/Close NvimTree" })
  vim.keymap.set("n", "<leader>tc", "<cmd>NvimTreeCollapse<cr>", { desc = "Collapse NvimTree recursively" })
  vim.keymap.set("n", "<leader>tr", "<cmd>NvimTreeRefresh<cr>", { desc = "Refresh file explorer" })
  vim.keymap.set("n", "<leader>tf", "<cmd>NvimTreeFindFileToggle<cr>", { desc = "Toggle file explorer on current" })
end

return Plugin
