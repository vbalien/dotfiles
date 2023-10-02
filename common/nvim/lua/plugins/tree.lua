return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local function my_on_attach(bufnr)
			local api = require("nvim-tree.api")
			api.config.mappings.default_on_attach(bufnr)
			vim.keymap.del("n", "<Tab>", { buffer = bufnr })
		end

		require("nvim-tree").setup({
			on_attach = my_on_attach,
			update_focused_file = {
				enable = true,
			},

			view = {
				side = "right",
				width = 45,
			},
			git = {
				enable = true,
				ignore = false,
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
		})
	end,
}
