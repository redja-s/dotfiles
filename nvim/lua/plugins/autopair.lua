-- Use-case:
-- - Autopairing for automatically completing pairs like () and {}
local Plugin = { "windwp/nvim-autopairs" }

Plugin.event = "InsertEnter"
Plugin.dependencies = {
  "hrsh7th/nvim-cmp",
  "windwp/nvim-ts-autotag",
}

function Plugin.config()
  local autopairs = require("nvim-autopairs")
  local ts_autopairs = require("nvim-ts-autotag")

  ts_autopairs.setup()

  autopairs.setup({
    check_ts = true,
    ts_config = {
      lua = { "string" },
      javascript = { "template_string" },
    },
  })
  local cmp_autopairs = require("nvim-autopairs.completion.cmp")

  local cmp = require("cmp")

  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

return Plugin
