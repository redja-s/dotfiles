local Plugin = { "nvim-telescope/telescope.nvim" }

Plugin.branch = "0.1.x"

Plugin.dependencies = {
  "nvim-lua/plenary.nvim",
  {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "BurntSushi/ripgrep",
  },
  "nvim-telescope/telescope-live-grep-args.nvim",
}

function Plugin.config()
  local telescope = require("telescope")
  local actions = require("telescope.actions")

  telescope.setup({
    defaults = {
      path_display = { "smart" },
      mappings = {
        i = {
          ["<C-k>"] = actions.move_selection_previous, -- move to previous result
          ["<C-j>"] = actions.move_selection_next, -- move to next result
          ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        },
      },
    },
  })
  telescope.load_extension("fzf")

  local keymap = vim.keymap.set
  local builtin = require("telescope.builtin")

  keymap("n", "ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
  keymap("n", "fr", "<cmd>Telescope oldfiles<cr>", { desc = "Find recent files" })
  keymap("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor" })
  keymap(
    "n",
    "<leader>fg",
    "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
    { desc = "Live grep" }
  )
  keymap("n", "gr", builtin.lsp_references, { desc = "References for currently selected word" })
  keymap("n", "fd", builtin.lsp_definitions, { desc = "Go to definition" })
  -- Setup which-key integration when pressing leader
  -- local wk = require("which-key")
  -- local builtin = require("telescope.builtin")
  -- wk.register({
  --   f = {
  --     name = "Telescope",
  --     f = { builtin.find_files, "Find files(2)" }
  --   },
  -- }, { prefix = "<leader>" })
end

return Plugin
