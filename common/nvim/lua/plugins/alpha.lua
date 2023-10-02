return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[　　　 　　/＾>》, -―‐‐＜＾}]],
			[[　　　 　./:::/,≠´::::::ヽ.]],
			[[　　　　/::::〃::::／}::丿ハ]],
			[[　　　./:::::i{l|／　ﾉ／ }::}]],
			[[　　 /:::::::瓜イ＞　´＜ ,:ﾉ]],
			[[　 ./::::::|ﾉﾍ.{､　(_ﾌ_ノﾉイ＿]],
			[[　 |:::::::|／}｀ｽ /          /]],
			[[.　|::::::|(_:::つ/         /　neovim!]],
			[[.￣￣￣￣￣￣￣＼/＿＿＿＿＿/￣￣￣￣￣]],
		}

		dashboard.section.buttons.val = {
			dashboard.button("f", "  Find project", "<Cmd>Telescope project<CR>", {}),

			dashboard.button("r", "  Recent files", "<Cmd>lua require'telescope.builtin'.oldfiles{}<CR>", {}),

			dashboard.button("q", "󰗼  Quit", "<Cmd>qa<CR>", {}),
		}

		require("alpha").setup(dashboard.config)
	end,
}
