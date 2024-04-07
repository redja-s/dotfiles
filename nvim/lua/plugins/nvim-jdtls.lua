local Plugin = { "mfussenegger/nvim-jdtls" }

vim.keymap.set(
  "n",
  "<leader>di",
  "<cmd>lua require('jdtls').organize_imports()<cr>",
  { desc = "Organise imports" }
)

return Plugin
