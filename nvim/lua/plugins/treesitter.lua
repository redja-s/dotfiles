local Plugin = { "nvim-treesitter/nvim-treesitter" }

Plugin.dependencies = {
  { "nvim-treesitter/nvim-treesitter-textobjects" },
}

-- See :help nvim-treesitter-modules
Plugin.opts = {
  -- :help nvim-treesitter-textobjects-modules
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
  ensure_installed = {
    "javascript",
    "typescript",
    "tsx",
    "c",
    "lua",
    "vim",
    "css",
    "json",
    "bash",
    "java",
    "sql",
  },
}

function Plugin.config()
  require("nvim-treesitter.configs").setup(Plugin.opts)
end

return Plugin
