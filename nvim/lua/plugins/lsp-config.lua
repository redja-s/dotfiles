local Plugin = { "neovim/nvim-lspconfig" }

Plugin.event = { "BufReadPre", "BufNewFile" }

Plugin.dependencies = {
  "hrsh7th/cmp-nvim-lsp",
  { "antosha417/nvim-lsp-file-operations", config = true },
}

function Plugin.config()
  -- Set keymaps for LSPs
  local keymap = vim.keymap
  local opts = { noremap = true, silent = true }
  local on_attach = function(bufnr)
    opts.buffer = bufnr
    opts.desc = "Show LSP references"
    keymap.set("n", "gR", "<cmd>Telescope lsp_references<cr>", opts)

    opts.desc = "Go to declaration"
    keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

    opts.desc = "Show LSP definitions"
    keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)

    opts.desc = "Show LSP implementation"
    keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts)

    opts.desc = "Show LSP type definition"
    keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", opts)

    opts.desc = "See available code actions"
    keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

    opts.desc = "Smart rename"
    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

    opts.desc = "Show buffer diagnostics"
    keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<cr>, opts")

    opts.desc = "Show line diagnostics"
    keymap.set("n", "<leader>d", vim.diagnostic.goto_prev, opts)

    opts.desc = "Go to next diagnostic"
    keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

    opts.desc = "Go to previous diagnostic"
    keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

    opts.desc = "Show documentation for what is under cursor"
    keymap.set("n", "K", vim.lsp.buf.hover, opts)

    opts.desc = "Restart LSP"
    keymap.set("n", "<leader>rs", ":LspRestart<cr>", opts)
  end

  local cmp_nvim_lsp = require("cmp_nvim_lsp")
  local capabilities = cmp_nvim_lsp.default_capabilities()

  -- TODO: Need to integrate utils signs here
  local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  local lspconfig = require("lspconfig")
  -- Configure options for LSPs
  lspconfig["html"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })

  lspconfig["tsserver"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })

  lspconfig["cssls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })

  lspconfig["tailwindcss"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })

  lspconfig["emmet_ls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
  })

  lspconfig["lua_ls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  })

  lspconfig["jdtls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    opts = {
      tabstop = 4,
      shiftwidth = 4,
    },
  })
end

return Plugin
