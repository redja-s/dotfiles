local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.tsserver.setup({
  capabilities = lsp_capabilities,
  settings = {
    completions = {
      completeFunctionCalls = true,
    },
  },
})
