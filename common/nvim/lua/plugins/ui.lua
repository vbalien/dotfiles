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
			"MunifTanjim/nui.nvim", -- LAS 대시보드용 사전 로드
		},
		config = function()
			-- LAS 모듈 캐싱 (매번 require 방지)
			local las_module = nil
			local las_checked = false

			local function get_las()
				if not las_checked then
					las_checked = true
					local ok, m = pcall(require, "las")
					if ok then
						las_module = m
					end
				end
				return las_module
			end

			-- LAS 상태 컴포넌트
			local las_status = {
				function()
					local las = get_las()
					if not las then
						return ""
					end
					local sl = las.statusline()
					if sl.condition() then
						return sl.get()
					end
					return ""
				end,
				cond = function()
					local las = get_las()
					if not las then
						return false
					end
					return las.statusline().condition()
				end,
				color = function()
					local las = get_las()
					if las and las.statusline().isOvertime() then
						return { fg = "#f38ba8" } -- 초과근무: 빨강
					end
					return { fg = "#a6e3a1" } -- 정상: 녹색
				end,
				on_click = function()
					local las = get_las()
					if las then
						las.statusline().on_click()
					end
				end,
			}

			require("lualine").setup({
				options = {
					theme = "catppuccin",
					section_separators = "",
					component_separators = "",
				},
				sections = {
					lualine_x = { las_status, "encoding", "fileformat", "filetype" },
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
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
				},
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
