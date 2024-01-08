-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Remap Ctrl+W to close buffer and switch to the previous buffer
vim.api.nvim_set_keymap("n", "<C-w>", ":bp<Bar>bd #<CR>", { noremap = true, silent = true })
