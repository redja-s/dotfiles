local Plugin = { "akinsho/bufferline.nvim" }

Plugin.event = "VeryLazy"
Plugin.dependencies = {
  "nvim-tree/nvim-web-devicons",
}

Plugin.keys = {
  { "<leader>bp", "<Cmd>BufferLineToggle<cr>", desc = "Toggle pin" },
  { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<cr>", desc = "Delete non-pinned buffers" },
  { "<leader>bo", "<Cmd>BufferLineCloseOthers<cr>", desc = "Delete other buffers" },
  { "<leader>br", "<Cmd>BufferLineCloseRight<cr>", desc = "Delete buffers to the right" },
  { "<leader>bl", "<Cmd>BufferLineCloseLeft<cr>", desc = "Delete buffers to the left" },
  { "<S-h>", "<Cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
  { "<S-l>", "<Cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
}

Plugin.opts = {
  options = {
    close_command = function(n)
      require("mini.bufremove").delete(n, false)
    end,
    right_mouse_command = function(n)
      require("mini.bufremove").delete(n, false)
    end,
    diagnostics = "nvim_lsp",
    always_show_bufferline = false,
    diagnostics_indicator = function(_, _, diag)
      local utils = require("../utils").signs
      local ret = (diag.error and utils.error .. diag.error .. " " or "")
        .. (diag.warning and utils.warn .. diag.warning or "")
      return vim.trim(ret)
    end,
    mode = "buffers",
    offsets = {
      {
        filetype = "NvimTree",
        text = "NvimTree",
        highlight = "Directory",
        text_align = "left",
      },
    },
  },

  -- :help bufferline-highlights
  highlights = {
    buffer_selected = {
      italic = false,
    },
    indicator_selected = {
      fg = { attribute = "fg", highlight = "Function" },
      italic = false,
    },
  },
}

function Plugin.config()
  require("bufferline").setup(Plugin.opts)

  -- vim.api.nvim_create_autocmd("BufAdd", {
  --   callback = function()
  --     vim.schedule(function()
  --       pcall(bufferline)
  --     end)
  --   end,
  -- })
end

return Plugin
