local Plugin = { "folke/trouble.nvim" }

Plugin.dependencies = {
  "nvim-tree/nvim-web-devicons",
  "folke/which-key.nvim",
}

Plugin.cmd = { "Trouble" }
Plugin.opts = { use_diagnostic_signs = true }
Plugin.keys = {
  { "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
  { "<leader>xx", "<cmd>Trouble diagnostics toggle focus=false filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
  { "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
  { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
  { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
  {
    "<C-[>",
    function()
      if require("trouble").is_open() then
        require("trouble").prev({ skip_groups = true, jump = true })
      else
        local ok, err = pcall(vim.cmd.cprev)
        if not ok then
          vim.notify(err, vim.log.levels.ERROR)
        end
      end
    end,
    desc = "Previous trouble/quickfix item",
  },
  {
    "<C-]>",
    function()
      if require("trouble").is_open() then
        require("trouble").next({ skip_groups = true, jump = true })
      else
        local ok, err = pcall(vim.cmd.cnext)
        if not ok then
          vim.notify(err, vim.log.levels.ERROR)
        end
      end
    end,
    desc = "Next trouble/quickfix item",
  },
}

function Plugin.init()
  local wk = require("which-key")
  wk.add({
    { "<leader>x", group = "Trouble" },
  })
end

return Plugin
