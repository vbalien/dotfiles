require("config.keymaps")
require("config.lazy")
require("config.options")

if not vim.g.vscode then
	require("config.theme")
end
