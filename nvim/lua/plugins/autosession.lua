local Plugin = { "rmagatti/auto-session" }

function Plugin.config()
  local auto_session = require("auto-session")

  auto_session.setup({
    auto_restore_enabled = false,
    auto_session_suppress_dirs = {
      "~",
      "~/Downloads",
      "~/Documents",
      "~/Desktop",
    },
    auto_save_enabled = true,
  })

  local keymap = vim.keymap

  keymap.set("n", "<leader>wr", "<cmd>SessionRestore<cr>", { desc = "Restore session" })
  keymap.set("n", "<leader>ws", "<cmd>SessionSave<cr>", { desc = "Save session" })
  keymap.set("n", "<leader>wd", "<cmd>SessionDelete<cr>", { desc = "Delete session" })
  keymap.set("n", "<leader>wS", "<cmd>Autosession search<cr>", { desc = "View all sessions" })
end

return Plugin
