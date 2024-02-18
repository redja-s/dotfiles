local Plugin = { "williamboman/mason.nvim" }

Plugin.dependencies = {
  "williamboman/mason-lspconfig.nvim",
}

function Plugin.config()
  local mason = require("mason")
  local mason_lspconfig = require("mason-lspconfig")

  mason.setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  })

  mason_lspconfig.setup({
    ensure_installed = {
      "tsserver",
      "html",
      "cssls",
      "tailwindcss",
      "svelte",
      "lua_ls",
      "graphql",
      "emmet_ls",
      "prismals",
      "pyright",
      "clangd",
      "bashls",
      "jdtls",
      "gradle_ls",
      "helm_ls",
      "yamlls",
      "sqls",
    },

    automatic_installation = true,
  })
end

Plugin.lazy = false

Plugin.opts = {
  ui = { border = "rounded" }
}

return Plugin
