local Plugin = { "rmagatti/auto-session" }

function Plugin.config()
  local auto_session = require("auto-session")

  auto_session.setup({
    auto_restore_enabled = false,
    auto_session_suppress_dirs = {
      "~",
      "~/Documents/code/",
      "~/Downloads",
      "~/Documents",
      "~/Desktop",
    },
  })

  local keymap = vim.keymap

  keymap.set(
    "n",
    "<leader>wr",
    "<cmd>SessionRestore<cr>",
    { desc = "Restore session" }
  )
  keymap.set(
    "n",
    "<leader>ws",
    "<cmd>SessionSave<cr>",
    { desc = "Save session" }
  )
end

return Plugin
