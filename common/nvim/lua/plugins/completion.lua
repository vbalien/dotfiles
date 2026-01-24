return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		dependencies = {
			{ "Bilal2453/luvit-meta", lazy = true },
		},
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				{ path = "snacks.nvim", words = { "Snacks" } },
				vim.env.VIMRUNTIME .. "/lua/vim/_meta",
			},
		},
		config = function(_, opts)
			require("lazydev").setup(opts)
			local current = vim.lsp.config.lua_ls or {}
			vim.lsp.config.lua_ls = vim.tbl_deep_extend("force", current, {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						workspace = { checkThirdParty = false },
						completion = { callSnippet = "Replace" },
						hint = { enable = true, setType = true, arrayIndex = "Disable" },
						diagnostics = { globals = { "vim", "Snacks" } },
						doc = { privateName = { "^_" } },
					},
				},
			})
		end,
	},

	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "1.*",
		event = "InsertEnter",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "default",
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide", "fallback" },
				["<CR>"] = { "accept", "fallback" },
				["<Tab>"] = {
					function(cmp)
						if cmp.snippet_active() then
							return cmp.accept()
						else
							return cmp.select_and_accept()
						end
					end,
					"snippet_forward",
					"fallback",
				},
				["<S-Tab>"] = { "snippet_backward", "fallback" },
				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				["<C-p>"] = { "select_prev", "fallback" },
				["<C-n>"] = { "select_next", "fallback" },
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
			},
			appearance = { nerd_font_variant = "mono" },
			completion = {
				accept = { auto_brackets = { enabled = true } },
				documentation = { auto_show = true, auto_show_delay_ms = 200 },
				ghost_text = { enabled = true },
				list = { selection = { preselect = true, auto_insert = true } },
				menu = { draw = { treesitter = { "lsp" } } },
			},
			signature = { enabled = true },
			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
