local Plugin = { "windwp/nvim-ts-autotag" }

function Plugin.config()
  require("nvim-ts-autotag").setup()
end

return Plugin
