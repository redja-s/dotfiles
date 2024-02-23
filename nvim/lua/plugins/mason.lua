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
      "lua_ls",
      "emmet_ls",
      "pyright",
      "clangd",
      "jdtls",
      "gradle_ls",
      "helm_ls",
      "sqls",
      "gopls"
    },
    automatic_installation = true,
  })

  mason_lspconfig.setup_handlers({
    function(server_name)
      require("lspconfig")[server_name].setup {}
    end,

    -- You can provide dedicated handlers for specific servers here e.g.
    -- ["rust_analyzer"] = function ()
    -- require("rust-tools").setup {}
    -- end
  })
end

Plugin.lazy = false

Plugin.opts = {
  ui = { border = "rounded" }
}

return Plugin
