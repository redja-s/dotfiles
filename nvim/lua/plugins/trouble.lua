local Plugin = { "folke/trouble.nvim" }

Plugin.dependencies = {
  "nvim-tree/nvim-web-devicons"
}

Plugin.cmd = { "TroubleToggle", "Trouble" }
Plugin.opts = { use_diagnostic_signs = true }
Plugin.keys = {
  { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Document Diagnostics (Trouble)" },
  { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
  { "<leader>xL", "<cmd>TroubleToggle loclist<cr>",               desc = "Location List (Trouble)" },
  { "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>",              desc = "Quickfix List (Trouble)" },
  {
    "<C-[>",
    function()
      if require("trouble").is_open() then
        require("trouble").previous({ skip_groups = true, jump = true })
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
  local map = vim.keymap.set

  map("n", "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", { desc = "Document Diagnostics (Trouble)" })
  map("n", "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", { desc = "Workspace Diagnostics (Trouble)" })
  map("n", "<leader>xL", "<cmd>TroubleToggle loclist<cr>", { desc = "Location List (Trouble)" })
  map("n", "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>", { desc = "Quickfix List (Trouble)" })
end

return Plugin
