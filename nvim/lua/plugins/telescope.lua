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

function Plugin.init()
  local builtin = require("telescope.builtin")
  local keymap = vim.keymap.set

  keymap("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
  keymap("n", "<leader>fr", builtin.oldfiles, { desc = "Previously open files" })
  keymap("n", "<leader>fc", builtin.grep_string, { desc = "Search for string under cursor" })
  keymap("n", "<leader>fg", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
    { desc = "Live grep" })
  keymap("n", "fr", builtin.lsp_references, { desc = "References for currently selected word" })
  keymap("n", "fd", builtin.lsp_definitions, { desc = "Go to definition" })
end

function Plugin.config()
  local telescope = require("telescope")
  local actions = require("telescope.actions")

  telescope.setup({
    defaults = {
      mappings = {
        i = {
          ["<C-k>"] = actions.move_selection_previous, -- move to previous result
          ["<C-j>"] = actions.move_selection_next,     -- move to next result
          ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        },
      },
    },
  })
  telescope.load_extension("fzf")

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
