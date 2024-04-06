local Plugin = { "williamboman/mason.nvim" }

Plugin.lazy = false

Plugin.opts = {
  ui = { border = "rounded" },
}

function Plugin.config()
  local mason = require("mason")
  mason.setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  })
end

return Plugin
