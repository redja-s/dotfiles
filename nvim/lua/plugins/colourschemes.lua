-- To use a colourscheme:
-- 1. Add the colourscheme to the Plugin map (lazy.nvim recommends priority=1000 to ensure it is loaded first)
-- 2. Change the vim.cmd in `init.lua` to use the required colourscheme
--  i. Example: `vim.cmd([[colourscheme gruvbox ]])` is the command to target the gruvbox plugin as it adds that colourscheme name
local Plugin = {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000
  }
}

return Plugin
