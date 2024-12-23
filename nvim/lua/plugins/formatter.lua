local Plugin = { "stevearc/conform.nvim" }

Plugin.event = { "BufWritePre" }
Plugin.cmd = { "ConformInfo" }

function Plugin.config()
  vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  local conform = require("conform")

  conform.setup({
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      json = { "prettier" },
      go = { "gofmt" },
      -- Comment as this conflicts with settings from ftplugin/java.lua
      -- java = { "google-java-format" },
      markdown = { "prettier" },
    },

    format_on_save = {
      async = false,
      lsp_fallback = true,
      timeout_ms = 1000,
    },

    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
    },
  })
end

return Plugin
