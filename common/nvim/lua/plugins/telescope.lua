return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = function()
			local actions = require("telescope.actions")
			return {
				defaults = {
					file_ignore_patterns = { "node_modules", ".yarn", ".git" },
					mappings = {
						i = {
							["<esc>"] = actions.close,
						},
					},
				},

				pickers = {
					find_files = {
						theme = "dropdown",
					},
					live_grep = {
						theme = "dropdown",
					},
					buffers = {
						theme = "dropdown",
						layout_config = {
							height = 10,
							width = 40,
						},
					},
					oldfiles = {
						previewer = false,
						theme = "dropdown",
					},
					symbols = {
						theme = "dropdown",
						layout_config = {
							height = 10,
							width = 40,
						},
					},
					current_buffer_fuzzy_find = { theme = "dropdown" },
					lsp_code_actions = {
						theme = "cursor",
						hidden = true,
					},
				},

				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							borderchars = require("util").borderchars({}),
						}),
					},

					project = {
						base_dirs = {
							"~/workspaces",
						},
						theme = "dropdown",
					},
				},
			}
		end,
		config = function(_, opts)
			require("telescope").setup(opts)
		end,
	},

	{
		"nvim-telescope/telescope-project.nvim",
		opts = {},
		event = "VeryLazy",
		config = function()
			require("telescope").load_extension("project")
		end,
		keys = {
			{ "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Projects" },
		},
	},
}
