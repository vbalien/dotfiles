_G.Util = {}

local get_mapper = function(mode, noremap)
  return function(lhs, rhs, opts)
    opts = opts or {}
    opts.noremap = noremap
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
  end
end

function Util.highlight(group, fg, bg, attr, sp)
  fg = fg and "guifg=" .. fg or "guifg=NONE"
  bg = bg and "guibg=" .. bg or "guibg=NONE"
  attr = attr and "gui=" .. attr or "gui=NONE"
  sp = sp and "guisp=" .. sp or ""

  vim.api.nvim_command(
    "highlight " .. group .. " " .. fg .. " " .. bg .. " " .. attr .. " " .. sp
  )
end

function Util.t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

Util.noremap = get_mapper("n", false)
Util.nnoremap = get_mapper("n", true)
Util.inoremap = get_mapper("i", true)
Util.tnoremap = get_mapper("t", true)
Util.vnoremap = get_mapper("v", true)

return Util
