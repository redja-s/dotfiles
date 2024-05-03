local Plugin = { "goolord/alpha-nvim" }

local utils = require("utils")
local banner = utils.banners.nvim1

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = banner
dashboard.section.buttons.val = {
  dashboard.button("f", " FFF ", ":Telescope find_files<cr>")
}

function Plugin.config()
  alpha.setup(dashboard.opts)
end

return Plugin
