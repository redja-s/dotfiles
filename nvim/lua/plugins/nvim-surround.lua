local Plugin = { "kylechui/nvim-surround" }

Plugin.event = { "BufReadPre", "BufNewFile" }
Plugin.version = "*"

function Plugin.config()
	require("nvim-surround").setup({})
end

return Plugin
