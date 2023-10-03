-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/data/data/com.termux/files/home/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/data/data/com.termux/files/home/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/data/data/com.termux/files/home/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/data/data/com.termux/files/home/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/data/data/com.termux/files/home/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    config = { "\27LJ\2\nÖ\1\0\0\4\0\t\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0'\2\a\0005\3\b\0B\0\3\1K\0\1\0\1\2\0\0\20javascriptreact\20typescriptreact\1\2\0\0\15javascript\15typescript\20filetype_extend\fluasnip\tload luasnip.loaders.from_vscode\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\n^\0\0\5\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\1K\0\1\0\topts\26alpha.themes.startify\nsetup\nalpha\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["dracula.nvim"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/dracula.nvim",
    url = "https://github.com/Mofiqul/dracula.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nç\4\0\0\3\0\t\0\0156\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0+\1\2\0=\1\4\0006\0\5\0'\2\6\0B\0\2\0029\0\a\0005\2\b\0B\0\2\1K\0\1\0\1\0\3\31show_current_context_start\2\25show_current_context\2\25space_char_blankline\6 \nsetup\21indent_blankline\frequire\tlist\bopt«\3        highlight IndentBlanklineChar guifg=#44475A guibg=none gui=nocombine\n        highlight IndentBlanklineSpaceChar guifg=none guibg=none gui=nocombine\n        highlight IndentBlanklineSpaceCharBlankline guifg=none guibg=none gui=nocombine\n        highlight IndentBlanklineContextChar guifg=#44475A guibg=#44475A gui=nocombine\n        highlight IndentBlanklineContextStart guifg=none guibg=#44475A gui=nocombine\n      \bcmd\bvim\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\nS\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\20floating_window\1\nsetup\18lsp_signature\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nŒ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\3\25component_separators\5\23section_separators\5\ntheme\17dracula-nvim\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\nt\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\rmappings\1\0\0\1\b\0\0\n<C-u>\n<C-d>\n<C-y>\n<C-e>\azt\azz\azb\nsetup\14neoscroll\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  nerdcommenter = {
    config = { "\27LJ\2\n4\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\23NERDAltDelims_java\6g\bvim\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://github.com/preservim/nerdcommenter"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nÜ\1\0\0\n\0\f\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0026\1\0\0'\3\4\0B\1\2\0029\2\5\1\18\4\2\0009\2\6\2'\5\a\0009\6\b\0005\b\n\0005\t\t\0=\t\v\bB\6\2\0A\2\2\1K\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nÐ\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20€6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2€+\2\1\0X\3\1€+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\1À\tbody\15lsp_expandÅ\1\0\1\3\3\5\0\29-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\19€-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\3\1B\1\1\1X\1\n€-\1\2\0B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\4\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\2À\rcomplete\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleŽ\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\tjump\rjumpable\21select_prev_item\fvisibleŒ\5\1\0\v\0*\0L6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0023\2\3\0009\3\4\0005\5\b\0005\6\6\0003\a\5\0=\a\a\6=\6\t\0055\6\f\0009\a\n\0009\a\v\aB\a\1\2=\a\r\0069\a\n\0009\a\14\aB\a\1\2=\a\15\0069\a\n\0009\a\16\a)\tüÿB\a\2\2=\a\17\0069\a\n\0009\a\16\a)\t\4\0B\a\2\2=\a\18\0069\a\n\0009\a\19\aB\a\1\2=\a\20\0069\a\n\0009\a\21\aB\a\1\2=\a\22\0069\a\n\0009\a\23\a5\t\26\0009\n\24\0009\n\25\n=\n\27\tB\a\2\2=\a\28\0069\a\n\0003\t\29\0005\n\30\0B\a\3\2=\a\31\0069\a\n\0003\t \0005\n!\0B\a\3\2=\a\"\6=\6\n\0059\6#\0009\6$\0064\b\3\0005\t%\0>\t\1\b5\t&\0>\t\2\b4\t\3\0005\n'\0>\n\1\tB\6\3\2=\6$\0055\6(\0=\6)\5B\3\2\0012\0\0€K\0\1\0\17experimental\1\0\1\15ghost_text\2\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-j>\21select_next_item\n<C-k>\1\0\0\21select_prev_item\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\0\fluasnip\bcmp\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-scrollview"] = {
    config = { "\27LJ\2\nT\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0005highlight ScrollView ctermbg=159 guibg=LightCyan\bcmd\bvim\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/nvim-scrollview",
    url = "https://github.com/dstein64/nvim-scrollview"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n†\2\0\0\a\0\15\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\6\0004\5\3\0005\6\5\0>\6\1\5=\5\a\4=\4\b\3=\3\t\0025\3\n\0=\3\v\2B\0\2\0016\0\f\0009\0\r\0)\1\1\0=\1\14\0K\0\1\0\27nvim_tree_quit_on_open\6g\bvim\bgit\1\0\2\vignore\1\venable\2\tview\rmappings\tlist\1\0\0\1\0\2\acb\24:NvimTreeToggle<cr>\bkey\n<Tab>\1\0\2\nwidth\3#\tside\nright\1\0\1\15auto_close\2\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nº\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\fautotag\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["stylua-nvim"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/stylua-nvim",
    url = "https://github.com/ckipp01/stylua-nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n÷\3\0\0\b\0\29\0\"6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\17\0005\4\5\0005\5\4\0=\5\6\0045\5\14\0005\6\b\0009\a\a\0=\a\t\0069\a\n\0=\a\v\0069\a\f\0=\a\r\6=\6\15\5=\5\16\4=\4\18\0035\4\20\0005\5\19\0=\5\21\0045\5\22\0=\5\23\0045\5\24\0=\5\25\0045\5\26\0=\5\27\4=\4\28\3B\1\2\1K\0\1\0\fpickers\21lsp_code_actions\1\0\2\vhidden\2\ntheme\vcursor\30current_buffer_fuzzy_find\1\0\1\ntheme\rdropdown\14live_grep\1\0\2\vhidden\2\ntheme\rdropdown\15find_files\1\0\0\1\0\2\vhidden\2\ntheme\rdropdown\rdefaults\1\0\0\rmappings\6i\1\0\0\n<C-k>\28move_selection_previous\n<C-j>\24move_selection_next\n<esc>\1\0\0\nclose\25file_ignore_patterns\1\0\0\1\4\0\0\17node_modules\n.yarn\t.git\nsetup\14telescope\22telescope.actions\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-prisma"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/vim-prisma",
    url = "https://github.com/pantharshit00/vim-prisma"
  },
  ["vim-rzip"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/vim-rzip",
    url = "https://github.com/lbrayner/vim-rzip"
  },
  ["vim-styled-components"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/vim-styled-components",
    url = "https://github.com/styled-components/vim-styled-components"
  },
  ["vim-wakatime"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/vim-wakatime",
    url = "https://github.com/wakatime/vim-wakatime"
  },
  ["zig.vim"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/zig.vim",
    url = "https://github.com/ziglang/zig.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nerdcommenter
time([[Config for nerdcommenter]], true)
try_loadstring("\27LJ\2\n4\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\23NERDAltDelims_java\6g\bvim\0", "config", "nerdcommenter")
time([[Config for nerdcommenter]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nº\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\fautotag\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\nÖ\1\0\0\4\0\t\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0'\2\a\0005\3\b\0B\0\3\1K\0\1\0\1\2\0\0\20javascriptreact\20typescriptreact\1\2\0\0\15javascript\15typescript\20filetype_extend\fluasnip\tload luasnip.loaders.from_vscode\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nç\4\0\0\3\0\t\0\0156\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0+\1\2\0=\1\4\0006\0\5\0'\2\6\0B\0\2\0029\0\a\0005\2\b\0B\0\2\1K\0\1\0\1\0\3\31show_current_context_start\2\25show_current_context\2\25space_char_blankline\6 \nsetup\21indent_blankline\frequire\tlist\bopt«\3        highlight IndentBlanklineChar guifg=#44475A guibg=none gui=nocombine\n        highlight IndentBlanklineSpaceChar guifg=none guibg=none gui=nocombine\n        highlight IndentBlanklineSpaceCharBlankline guifg=none guibg=none gui=nocombine\n        highlight IndentBlanklineContextChar guifg=#44475A guibg=#44475A gui=nocombine\n        highlight IndentBlanklineContextStart guifg=none guibg=#44475A gui=nocombine\n      \bcmd\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nÐ\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20€6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2€+\2\1\0X\3\1€+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\1À\tbody\15lsp_expandÅ\1\0\1\3\3\5\0\29-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\19€-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\3\1B\1\1\1X\1\n€-\1\2\0B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\4\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\2À\rcomplete\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleŽ\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\tjump\rjumpable\21select_prev_item\fvisibleŒ\5\1\0\v\0*\0L6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0023\2\3\0009\3\4\0005\5\b\0005\6\6\0003\a\5\0=\a\a\6=\6\t\0055\6\f\0009\a\n\0009\a\v\aB\a\1\2=\a\r\0069\a\n\0009\a\14\aB\a\1\2=\a\15\0069\a\n\0009\a\16\a)\tüÿB\a\2\2=\a\17\0069\a\n\0009\a\16\a)\t\4\0B\a\2\2=\a\18\0069\a\n\0009\a\19\aB\a\1\2=\a\20\0069\a\n\0009\a\21\aB\a\1\2=\a\22\0069\a\n\0009\a\23\a5\t\26\0009\n\24\0009\n\25\n=\n\27\tB\a\2\2=\a\28\0069\a\n\0003\t\29\0005\n\30\0B\a\3\2=\a\31\0069\a\n\0003\t \0005\n!\0B\a\3\2=\a\"\6=\6\n\0059\6#\0009\6$\0064\b\3\0005\t%\0>\t\1\b5\t&\0>\t\2\b4\t\3\0005\n'\0>\n\1\tB\6\3\2=\6$\0055\6(\0=\6)\5B\3\2\0012\0\0€K\0\1\0\17experimental\1\0\1\15ghost_text\2\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-j>\21select_next_item\n<C-k>\1\0\0\21select_prev_item\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\0\fluasnip\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\nS\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\20floating_window\1\nsetup\18lsp_signature\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\nÜ\1\0\0\n\0\f\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0026\1\0\0'\3\4\0B\1\2\0029\2\5\1\18\4\2\0009\2\6\2'\5\a\0009\6\b\0005\b\n\0005\t\t\0=\t\v\bB\6\2\0A\2\2\1K\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nŒ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\3\25component_separators\5\23section_separators\5\ntheme\17dracula-nvim\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n÷\3\0\0\b\0\29\0\"6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\17\0005\4\5\0005\5\4\0=\5\6\0045\5\14\0005\6\b\0009\a\a\0=\a\t\0069\a\n\0=\a\v\0069\a\f\0=\a\r\6=\6\15\5=\5\16\4=\4\18\0035\4\20\0005\5\19\0=\5\21\0045\5\22\0=\5\23\0045\5\24\0=\5\25\0045\5\26\0=\5\27\4=\4\28\3B\1\2\1K\0\1\0\fpickers\21lsp_code_actions\1\0\2\vhidden\2\ntheme\vcursor\30current_buffer_fuzzy_find\1\0\1\ntheme\rdropdown\14live_grep\1\0\2\vhidden\2\ntheme\rdropdown\15find_files\1\0\0\1\0\2\vhidden\2\ntheme\rdropdown\rdefaults\1\0\0\rmappings\6i\1\0\0\n<C-k>\28move_selection_previous\n<C-j>\24move_selection_next\n<esc>\1\0\0\nclose\25file_ignore_patterns\1\0\0\1\4\0\0\17node_modules\n.yarn\t.git\nsetup\14telescope\22telescope.actions\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-scrollview
time([[Config for nvim-scrollview]], true)
try_loadstring("\27LJ\2\nT\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0005highlight ScrollView ctermbg=159 guibg=LightCyan\bcmd\bvim\0", "config", "nvim-scrollview")
time([[Config for nvim-scrollview]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\2\nt\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\rmappings\1\0\0\1\b\0\0\n<C-u>\n<C-d>\n<C-y>\n<C-e>\azt\azz\azb\nsetup\14neoscroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n†\2\0\0\a\0\15\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\6\0004\5\3\0005\6\5\0>\6\1\5=\5\a\4=\4\b\3=\3\t\0025\3\n\0=\3\v\2B\0\2\0016\0\f\0009\0\r\0)\1\1\0=\1\14\0K\0\1\0\27nvim_tree_quit_on_open\6g\bvim\bgit\1\0\2\vignore\1\venable\2\tview\rmappings\tlist\1\0\0\1\0\2\acb\24:NvimTreeToggle<cr>\bkey\n<Tab>\1\0\2\nwidth\3#\tside\nright\1\0\1\15auto_close\2\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n^\0\0\5\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\1K\0\1\0\topts\26alpha.themes.startify\nsetup\nalpha\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
