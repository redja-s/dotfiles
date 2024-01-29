local Plugin = { "stevearc/conform.nvim" }

Plugin.event = { "BufWritePre" }
Plugin.cmd = { "ConformInfo" }

Plugin.opts = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    javascript = { { "prettierd", "prettier" } },
  },
  format_on_save = { timeout_ms = 500, lsp_fallback = true },

  formatters = {
    shfmt = {
      prepend_args = { "-i", "2" },
    },
  },
}

function Plugin.init()
  vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
end

return Plugin
