return {
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
		"romgrk/barbar.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "<leader>bp", "<Cmd>BufferPin<CR>", desc = "Toggle pin" },
			{ "<leader>bP", "<Cmd>BufferCloseAllButPinned<CR>", desc = "Delete non-pinned buffers" },
			{ "<S-h>", "<Cmd>BufferPrevious<CR>", desc = "Prev buffer" },
			{ "<S-l>", "<Cmd>BufferNext<CR>", desc = "Next buffer" },
			{ "<leader>bd", "<Cmd>BufferClose<CR>", desc = "Close buffer" },
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			animation = false,
			auto_hide = false,
			icons = {
				diagnostics = {
					[vim.diagnostic.severity.ERROR] = { enabled = true },
					[vim.diagnostic.severity.WARN] = { enabled = true },
				},
			},
			sidebar_filetypes = {
				NvimTree = true,
			},
		},
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		opts = {
			lsp = {
				signature = { enabled = false },
				progress = { enabled = false },
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
	},
}
