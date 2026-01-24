_G.Util = {}

local get_mapper = function(mode, noremap)
	return function(lhs, rhs, opts)
		opts = opts or {}
		opts.noremap = noremap
		vim.keymap.set(mode, lhs, rhs, opts)
	end
end

Util.nnoremap = get_mapper("n", true)
Util.inoremap = get_mapper("i", true)
Util.tnoremap = get_mapper("t", true)
Util.vnoremap = get_mapper("v", true)

function Util.on_attach(on_attach)
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local buffer = args.buf
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			on_attach(client, buffer)
		end,
	})
end

return Util
