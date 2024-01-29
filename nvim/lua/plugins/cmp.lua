local Plugin = { 'hrsh7th/nvim-cmp' }

Plugin.dependencies = {
  -- Sources
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'hrsh7th/cmp-nvim-lsp' },

  -- Snippets
  { 'L3MON4D3/LuaSnip' },
  { 'rafamadriz/friendly-snippets' },
}

Plugin.event = 'InsertEnter'

function Plugin.config()
  vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

  local cmp = require('cmp')
  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  local luasnip = require('luasnip')

  require('luasnip.loaders.from_vscode').lazy_load()

  local select_opts = { behavior = cmp.SelectBehavior.Select }

  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

  -- See :help cmp-config
  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    formatting = {
      fields = { 'menu', 'abbr', 'kind' },
      format = function(entry, item)
        local menu_icon = {
          nvim_lsp = 'λ',
          luasnip = '⋗',
          buffer = 'Ω',
          path = '🖫',
        }

        item.menu = menu_icon[entry.source.name]
        return item
      end,
    },
    -- See :help cmp-mapping
    mapping = {
      ['<C-k>'] = cmp.mapping.select_prev_item(select_opts),
      ['<C-j>'] = cmp.mapping.select_next_item(select_opts),

      ['<C-b>'] = cmp.mapping.scroll_docs(-1),
      ['<C-f>'] = cmp.mapping.scroll_docs(1),

      ["<C-Space>"] = cmp.mapping.complete(),

      ['<C-e>'] = cmp.mapping.abort(),
      ['<C-y>'] = cmp.mapping.confirm({ select = true }),
      ['<CR>'] = cmp.mapping.confirm({ select = false }),

      ['<C-f>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(1) then
          luasnip.jump(1)
        else
          fallback()
        end
      end, { 'i', 's' }),

      ['<C-b>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),

      ['<Tab>'] = cmp.mapping(function(fallback)
        local col = vim.fn.col('.') - 1

        if cmp.visible() then
          cmp.select_next_item(select_opts)
        elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
          fallback()
        else
          cmp.complete()
        end
      end, { 'i', 's' }),

      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item(select_opts)
        else
          fallback()
        end
      end, { 'i', 's' }),
    },
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
    }, {
      { name = "buffer" },
    }),
  })
end

return Plugin
