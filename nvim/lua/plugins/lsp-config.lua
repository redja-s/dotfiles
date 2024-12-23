local Plugin = { "neovim/nvim-lspconfig" }

Plugin.dependencies = {
  "hrsh7th/cmp-nvim-lsp",
  { "antosha417/nvim-lsp-file-operations", config = true },
  "williamboman/mason.nvim",
  { "williamboman/mason-lspconfig.nvim" },
  { "folke/neodev.nvim", opts = {} },
}

Plugin.cmd = { "LspInfo", "LspInstall", "LspUnInstall" }
Plugin.event = { "BufReadPre", "BufNewFile" }

function Plugin.init()
  local sign = function(opts)
    vim.fn.sign_define(opts.name, {
      texthl = opts.name,
      text = opts.text,
      numhl = "",
    })
  end

  sign({ name = "DiagnosticSignError", text = "✘" })
  sign({ name = "DiagnosticSignWarn", text = "▲" })
  sign({ name = "DiagnosticSignHint", text = "⚑" })
  sign({ name = "DiagnosticSignInfo", text = "»" })

  -- See :help vim.diagnostic.config()
  vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
    float = {
      border = "rounded",
      source = "always",
    },
  })

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
end

-- Used in mason-lspconfig ensure_installed
local default_installs = {
  "html",
  "htmx",
  "jsonls",
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
  "gopls",
}

function Plugin.config()
  local lspconfig = require("lspconfig")
  local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

  require("mason-lspconfig").setup({
    ensure_installed = default_installs,
    handlers = {
      -- This is the default handler which is used when no dedicated handler exists below
      function(server)
        lspconfig[server].setup({
          capabilities = lsp_capabilities,
        })
      end,

      -- Don't do anything for jdtls, this is covered by nvim-jdtls
      -- Find the config for Java under nvim/ftpluin/java.lua
      ["jdtls"] = function() end,

      ["lua_ls"] = function()
        require("plugins.lsp.lua_ls")
      end,

      ["html"] = function()
        require("plugins.lsp.html")
      end,

      ["gradle_ls"] = function()
        require("plugins.lsp.gradle_ls")
      end,
    },
    automatic_installation = true,
  })

  local options = { noremap = true, silent = true, buffer = true }
  options.desc = "Show references"
  vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<cr>", options)

  options.desc = "Show declaration"
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, options)

  options.desc = "Show definitions"
  vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", options)

  options.desc = "Show implementation"
  vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", options)

  options.desc = "Show type definition"
  vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", options)

  options.desc = "Show code actions"
  vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, options)

  options.desc = "Smart rename"
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, options)

  options.desc = "Show buffer diagnostics"
  vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<cr>", options)

  options.desc = "Show line diagnostics"
  vim.keymap.set("n", "<leader>d", vim.diagnostic.goto_prev, options)

  options.desc = "Next diagnostic"
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, options)

  options.desc = "Previous diagnostic"
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, options)

  options.desc = "Show documentation for what is under cursor"
  vim.keymap.set("n", "K", vim.lsp.buf.hover, options)

  options.desc = "Restart LSP"
  vim.keymap.set("n", "<leader>rs", "<cmd>LspRestart<cr>", options)
end

return Plugin
