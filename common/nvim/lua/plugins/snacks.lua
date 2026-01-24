return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- Performance optimizations
			bigfile = { enabled = true },
			quickfile = { enabled = true },

			-- Dashboard (replaces alpha-nvim)
			dashboard = {
				enabled = true,
				preset = {
					header = table.concat({
						"　　　 　　/＾>》, -―‐‐＜＾}           ",
						"　　　 　./:::/,≠´::::::ヽ.            ",
						"　　　　/::::〃::::／}::丿ハ           ",
						"　　　./:::::i{l|／　ﾉ／ }::}          ",
						"　　 /:::::::瓜イ＞　´＜ ,:ﾉ           ",
						"　 ./::::::|ﾉﾍ.{､　(_ﾌ_ノﾉイ＿         ",
						"　 |:::::::|／}｀ｽ /          /        ",
						".　|::::::|(_:::つ/         /　neovim!",
						".￣￣￣￣￣￣￣＼/＿＿＿＿＿/￣￣￣￣￣",
					}, "\n"),
					keys = {
						{ icon = "󰉋 ", key = "p", desc = "Projects", action = ":lua Snacks.picker.projects()" },
						{ icon = "󰋚 ", key = "r", desc = "Recent Files", action = ":lua Snacks.picker.recent()" },
						{ icon = "󰈞 ", key = "f", desc = "Find File", action = ":lua Snacks.picker.files()" },
						{ icon = "󰊄 ", key = "g", desc = "Find Text", action = ":lua Snacks.picker.grep()" },
						{
							icon = "󰒓 ",
							key = "c",
							desc = "Config",
							action = ":lua Snacks.picker.files({ cwd = vim.fn.stdpath('config') })",
						},
						{ icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
						{ icon = "󰩈 ", key = "q", desc = "Quit", action = ":qa" },
					},
				},
			},

			-- UI enhancements
			indent = {
				enabled = true,
				animate = { enabled = false },
				scope = {
					underline = true, -- underline the start of the scope
				},
			},
			input = { enabled = true }, -- replaces dressing.nvim input
			notifier = {
				enabled = true,
				timeout = 3000,
				top_down = false,
				style = "minimal",
			},
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true }, -- replaces vim-illuminate

			-- Picker (replaces telescope.nvim)
			picker = {
				enabled = true,
				sources = {
					files = {
						hidden = true,
						ignored = false,
					},
				},
				win = {
					input = {
						keys = {
							["<Esc>"] = { "close", mode = { "n", "i" } },
						},
					},
				},
			},

			styles = {
				notification = {
					wo = { wrap = true },
				},
			},
		},
		keys = {
			-- File navigation
			{
				"<Leader>p",
				function()
					Snacks.picker.files()
				end,
				desc = "Find Files",
			},
			{
				"<Leader>o",
				function()
					Snacks.picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<Leader>f",
				function()
					Snacks.picker.lines({ layout = "select" })
				end,
				desc = "Buffer Lines",
			},
			{
				"<Leader>ff",
				function()
					Snacks.picker.grep()
				end,
				desc = "Workspace Grep",
			},
			{
				"<Leader><S-a>",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Buffers",
			},
			{
				"<Leader><S-o>",
				function()
					Snacks.picker.projects()
				end,
				desc = "Projects",
			},

			-- LSP
			{
				"gd",
				function()
					Snacks.picker.lsp_definitions()
				end,
				desc = "Go to Definition",
			},
			{
				"gr",
				function()
					Snacks.picker.lsp_references()
				end,
				desc = "References",
			},
			{
				"gI",
				function()
					Snacks.picker.lsp_implementations()
				end,
				desc = "Implementations",
			},
			{
				"gy",
				function()
					Snacks.picker.lsp_type_definitions()
				end,
				desc = "Type Definitions",
			},
			{
				"<Leader>ss",
				function()
					Snacks.picker.lsp_symbols()
				end,
				desc = "LSP Symbols",
			},
			{
				"<Leader>sS",
				function()
					Snacks.picker.lsp_workspace_symbols()
				end,
				desc = "Workspace Symbols",
			},

			-- Search
			{
				"<Leader>:",
				function()
					Snacks.picker.command_history()
				end,
				desc = "Command History",
			},
			{
				"<Leader>sh",
				function()
					Snacks.picker.help()
				end,
				desc = "Help Pages",
			},
			{
				"<Leader>sk",
				function()
					Snacks.picker.keymaps()
				end,
				desc = "Keymaps",
			},
			{
				"<Leader>sm",
				function()
					Snacks.picker.marks()
				end,
				desc = "Marks",
			},
			{
				"<Leader>sr",
				function()
					Snacks.picker.resume()
				end,
				desc = "Resume",
			},
			{
				"<Leader>sd",
				function()
					Snacks.picker.diagnostics()
				end,
				desc = "Diagnostics",
			},

			-- Git
			{
				"<Leader>gb",
				function()
					Snacks.picker.git_branches()
				end,
				desc = "Git Branches",
			},
			{
				"<Leader>gl",
				function()
					Snacks.picker.git_log()
				end,
				desc = "Git Log",
			},
			{
				"<Leader>gs",
				function()
					Snacks.picker.git_status()
				end,
				desc = "Git Status",
			},

			-- Notifications
			{
				"<Leader>n",
				function()
					Snacks.picker.notifications()
				end,
				desc = "Notifications",
			},

			-- Words navigation (replaces vim-illuminate keymaps)
			{
				"]]",
				function()
					Snacks.words.jump(vim.v.count1)
				end,
				desc = "Next Reference",
				mode = { "n", "t" },
			},
			{
				"[[",
				function()
					Snacks.words.jump(-vim.v.count1)
				end,
				desc = "Prev Reference",
				mode = { "n", "t" },
			},
		},
		init = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = "VeryLazy",
				callback = function()
					_G.dd = function(...)
						Snacks.debug.inspect(...)
					end
					_G.bt = function()
						Snacks.debug.backtrace()
					end
					vim.print = _G.dd
				end,
			})

			-- LSP Progress through snacks notifier
			vim.api.nvim_create_autocmd("LspProgress", {
				callback = function(ev)
					local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
					vim.notify(vim.lsp.status(), "info", {
						id = "lsp_progress",
						title = "LSP Progress",
						opts = function(notif)
							notif.icon = ev.data.params.value.kind == "end" and " "
								or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
						end,
					})
				end,
			})
		end,
	},
}
