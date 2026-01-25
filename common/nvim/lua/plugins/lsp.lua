return {
	-- Breadcrumbs in winbar (clickable with sibling navigation)
	{
		"Bekaboo/dropbar.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			menu = {
				preview = false,
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		opts = {
			capabilities = {},
			servers = { jsonls = {} },
			setup = {},
		},
		config = function(_, opts)
			-- Suppress stylua LSP (stylua 2.x removed --lsp flag)
			vim.lsp.config("stylua", { cmd = { "true" }, filetypes = {} })

			local has_blink, blink = pcall(require, "blink.cmp")
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				has_blink and blink.get_lsp_capabilities() or {},
				opts.capabilities or {}
			)

			local function setup(server)
				local server_opts = vim.tbl_deep_extend("force", {
					capabilities = vim.deepcopy(capabilities),
				}, opts.servers[server] or {})

				if opts.setup[server] then
					if opts.setup[server](server, server_opts) then
						return
					end
				elseif opts.setup["*"] then
					if opts.setup["*"](server, server_opts) then
						return
					end
				end
				-- Use new vim.lsp API (Neovim 0.11+)
				vim.lsp.config(server, server_opts)
				vim.lsp.enable(server)
			end

			local have_mason, mlsp = pcall(require, "mason-lspconfig")
			if have_mason then
				mlsp.setup({
					ensure_installed = vim.tbl_keys(opts.servers),
					automatic_installation = false,
				})
				-- Setup servers after mason-lspconfig is ready
				for _, server in ipairs(mlsp.get_installed_servers()) do
					setup(server)
				end
			end

			for server, server_opts in pairs(opts.servers) do
				if server_opts and server_opts.mason == false then
					setup(server)
				end
			end
		end,
	},

	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		build = ":MasonUpdate",
		opts = {
			ensure_installed = { "stylua", "shfmt" },
		},
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			local function ensure_installed()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end
			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end,
	},
}
