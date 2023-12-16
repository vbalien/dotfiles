return {
	{
		"stevearc/dressing.nvim",
		lazy = true,
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},

	{
		"dstein64/nvim-scrollview",
		event = "VeryLazy",
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("lualine").setup({
				options = {
					theme = "catppuccin",
					section_separators = "",
					component_separators = "",
				},
			})
		end,
	},

	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
			{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
		},
		opts = {
			options = {
				highlights = require("catppuccin.groups.integrations.bufferline").get(),
				diagnostics = "nvim_lsp",
				always_show_bufferline = true,
				offsets = {
					{
						filetype = "NvimTree",
						text = "NvimTree",
						highlight = "Directory",
						text_align = "center",
					},
				},
			},
		},
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				signature = {
					enabled = false,
				},
			},
			presets = {
				lsp_doc_border = true,
			},

			views = {
				cmdline_popup = {
					border = { style = "single" },
				},
				popupmenu = {
					border = { style = "single" },
				},
				hover = {
					border = { style = "single" },
				},
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},

	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {
			noice = true,
			-- floating_window = false,
		},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
}
