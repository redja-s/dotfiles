local Plugin = { "lewis6991/gitsigns.nvim" }

function Plugin.config()
  local gitsigns = require("gitsigns")

  gitsigns.setup({
    signs = {
      add = { text = "┃" },
      change = { text = "┃" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "┆" },
    },
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
      follow_files = true,
    },
    auto_attach = true,
    attach_to_untracked = false,
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
      delay = 100,
      ignore_whitespace = false,
      virt_text_priority = 100,
    },
    current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    current_line_blame_formatter_opts = {
      relative_time = false,
    },
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000, -- Disable if file is longer than this (in lines)
    preview_config = {
      -- Options passed to nvim_open_win
      border = "single",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
    on_attach = function(bufnr)
      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      -- Navigation
      map("n", "]c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gitsigns.nav_hunk("next")
        end
      end)

      map("n", "[c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gitsigns.nav_hunk("prev")
        end
      end)

      -- Actions
      map("n", "<leader>hs", gitsigns.stage_hunk, "Next Hunk")
      map("n", "<leader>hr", gitsigns.reset_hunk, "Prev Hunk")
      map("v", "<leader>hs", function()
        gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Stage Hunk")
      map("v", "<leader>hr", function()
        gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Reset Hunk")
      map("n", "<leader>hS", gitsigns.stage_buffer, "Stage Buffer")
      map("n", "<leader>hu", gitsigns.undo_stage_hunk, "Undo Stage Hunk")
      map("n", "<leader>hR", gitsigns.reset_buffer, "Reset Changes")
      map("n", "<leader>hp", gitsigns.preview_hunk, "Preview Hunk")
      map("n", "<leader>hb", function()
        gitsigns.blame_line({ full = true })
      end, "Blame line")

      map(
        "n",
        "<leader>tb",
        gitsigns.toggle_current_line_blame,
        "Toggle Blame line"
      )
      map("n", "tb", gitsigns.toggle_current_line_blame, "Toggle Blame line")

      map("n", "<leader>hd", gitsigns.diffthis, "Diff This")
      map("n", "<leader>hD", function()
        gitsigns.diffthis("~")
      end, "Diff This ~")

      map("n", "<leader>td", gitsigns.toggle_deleted, "Toggle Deleted")
      map("n", "td", gitsigns.toggle_deleted, "Toggle Deleted")

      -- Text object
      map(
        { "o", "x" },
        "ih",
        ":<C-U>Gitsigns select_hunk<CR>",
        "GitSigns - Select Hunk"
      )
    end,
  })
end

return Plugin
