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
  -- keymap("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
  keymap("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
  keymap("n", "<leader>fr", builtin.oldfiles, { desc = "Previously open files" })
  keymap("n", "<leader>fc", builtin.grep_string, { desc = "Search for string under cursor" })
  keymap("n", "<leader>fg", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
    { desc = "Live grep" })
  keymap("n", "fr", builtin.lsp_references, { desc = "References for currently selected word" })
  keymap("n", "fd", builtin.lsp_definitions, { desc = "Go to definition" })

  -- vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
  -- vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
  -- vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
  -- vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
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
end

return Plugin
