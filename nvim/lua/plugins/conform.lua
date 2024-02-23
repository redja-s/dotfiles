local Plugin = { "stevearc/conform.nvim" }

Plugin.event = { "BufWritePre" }
Plugin.cmd = { "ConformInfo" }

function Plugin.init()
  vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

  local conform = require("conform")
  conform.setup({
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      javascript = { "prettierd", "prettier" },
      go = { "gofmt" },
      -- "*" filetype runs formatter on all filetypes
      ["*"] = { "codespell" },
    },

    format_on_save = {
      lsp_fallback = true,
      timeout_ms = 500,
    },

    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
    },
  })
end

return Plugin
