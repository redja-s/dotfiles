local Plugin = { "neovim/nvim-lspconfig" }
local user = {}

Plugin.dependencies = {
  "hrsh7th/cmp-nvim-lsp",
  { "antosha417/nvim-lsp-file-operations", config = true },
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

function Plugin.config()
  local lspconfig = require("lspconfig")
  local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

  local group = vim.api.nvim_create_augroup("lsp_cmds", { clear = true })

  vim.api.nvim_create_autocmd("LspAttach", {
    group = group,
    desc = "LSP Actions",
    callback = user.on_attach,
  })

  require("mason-lspconfig").setup({
    ensure_installed = {
      "tsserver",
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
    },
    handlers = {
      function(server)
        lspconfig[server].setup({
          capabilities = lsp_capabilities,
        })
      end,
      ["tsserver"] = function()
        lspconfig.tsserver.setup({
          capabilities = lsp_capabilities,
          settings = {
            completions = {
              completeFunctionCalls = true,
            },
          },
        })
      end,

      ["lua_ls"] = function()
        require("plugins.lsp.lua_ls")
      end,

      ["html"] = function()
        require("plugins.lsp.html")
      end,
    },
    automatic_installation = true,
  })

  -- TODO: Need to integrate utils signs here
  local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end
end

-- Set keymaps for LSPs
local opts = { noremap = true, silent = true, buffer = true }
function user.on_attach()
  local bufmap = function(mode, lhs, rhs, o)
    vim.keymap.set(mode, lhs, rhs, o)
  end

  opts.desc = "Show LSP references"
  bufmap("n", "gR", "<cmd>Telescope lsp_references<cr>", opts)

  opts.desc = "Go to declaration"
  bufmap("n", "gD", vim.lsp.buf.declaration, opts)

  opts.desc = "Show LSP definitions"
  bufmap("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)

  opts.desc = "Show LSP implementation"
  bufmap("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts)

  opts.desc = "Show LSP type definition"
  bufmap("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", opts)

  opts.desc = "See available code actions"
  bufmap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

  opts.desc = "Smart rename"
  bufmap("n", "<leader>rn", vim.lsp.buf.rename, opts)

  opts.desc = "Show buffer diagnostics"
  bufmap("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<cr>, opts")

  opts.desc = "Show line diagnostics"
  bufmap("n", "<leader>d", vim.diagnostic.goto_prev, opts)

  opts.desc = "Go to next diagnostic"
  bufmap("n", "]d", vim.diagnostic.goto_next, opts)

  opts.desc = "Go to previous diagnostic"
  bufmap("n", "[d", vim.diagnostic.goto_prev, opts)

  opts.desc = "Show documentation for what is under cursor"
  bufmap("n", "K", vim.lsp.buf.hover, opts)

  opts.desc = "Restart LSP"
  bufmap("n", "<leader>rs", ":LspRestart<cr>", opts)
end

return Plugin
