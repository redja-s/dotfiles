local Plugin = { "goolord/alpha-nvim" }

Plugin.dependencies = { "nvim-tree/nvim-web-devicons" }

function Plugin.config()
  require("alpha").setup(require("alpha.themes.dashboard").config)
end

return Plugin

