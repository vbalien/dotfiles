return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local severity = vim.diagnostic.severity
		require("trouble").setup({
			mode = "document_diagnostics",
			severity = severity.WARN,
			auto_open = true,
			auto_close = true,
			auto_fold = false,
			height = 8,
			action_keys = {
				jump_close = {},
				toggle_fold = { "o" },
			},
		})
	end,
}
