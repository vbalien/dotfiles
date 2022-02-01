local util = require "util"
local nnoremap = util.nnoremap
local inoremap = util.inoremap
local t = util.t

function _G.smart_tab(is_shift)
  if is_shift then
    return vim.fn.pumvisible() == 1 and t "<C-n>" or t "<Tab>"
  else
    return vim.fn.pumvisible() == 1 and t "<C-p>" or t "<s-Tab>"
  end
end

inoremap("<Tab>", "v:lua.smart_tab()", { expr = true, noremap = true })
inoremap("<s-Tab>", "v:lua.smart_tab()", { expr = true, noremap = true })

nnoremap("<Tab>", ":NvimTreeToggle<CR>", { silent = true })

nnoremap("K", "<cmd>lua vim.lsp.buf.hover()<CR>", { silent = true })
nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { silent = true })
nnoremap(
  "<Space>ca",
  "<cmd>lua require'telescope.builtin'.lsp_code_actions{}<CR>",
  { silent = true }
)

nnoremap("<C-p>", ":Telescope find_files<CR>", { silent = true })
nnoremap("<C-o>", ":Telescope live_grep<CR>", { silent = true })
nnoremap("<C-f>", ":Telescope current_buffer_fuzzy_find<CR>", {
  silent = true,
})
