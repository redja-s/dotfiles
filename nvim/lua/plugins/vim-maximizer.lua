local Plugin = { "szw/vim-maximizer" }

Plugin.keys = {
	{ "<leader>sm", "<cmd>MaximizerToggle<cr>", desc = "Maximise/Minimise a split" },
}

return Plugin
