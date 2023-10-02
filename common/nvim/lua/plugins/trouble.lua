return {
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require("trouble").setup {
      auto_open = true,
      auto_close = true,
      auto_fold = true,
      height = 8,
      action_keys = {
        jump_close = {},
        toggle_fold = { "o" },
      },
    }
  end,
}
