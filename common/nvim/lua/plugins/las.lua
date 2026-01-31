return {
  {
    dir = "~/workspaces/las-nvim",
    dependencies = {
      { "folke/snacks.nvim", optional = true },
      { "MunifTanjim/nui.nvim", optional = true },
    },
    cmd = {
      "LasCheckIn",
      "LasCheckOut",
      "LasStartBreak",
      "LasMeal",
      "LasReturn",
      "LasChangeLocation",
      "LasStatus",
      "LasDashboard",
      "LasSetApiKey",
      "LasRefresh",
    },
    keys = {
      { "<leader>A", "", desc = "+LAS 근태관리" },
      { "<leader>Ai", "<cmd>LasCheckIn<cr>", desc = "출근" },
      { "<leader>Ao", "<cmd>LasCheckOut<cr>", desc = "퇴근" },
      { "<leader>Ad", "<cmd>LasDashboard<cr>", desc = "대시보드" },
      { "<leader>As", "<cmd>LasStatus<cr>", desc = "상태" },
      { "<leader>Ab", "<cmd>LasStartBreak<cr>", desc = "자리비움" },
      { "<leader>Am", "<cmd>LasMeal<cr>", desc = "식사" },
      { "<leader>Ar", "<cmd>LasReturn<cr>", desc = "복귀" },
      { "<leader>Al", "<cmd>LasChangeLocation<cr>", desc = "위치변경" },
      { "<leader>AR", "<cmd>LasRefresh<cr>", desc = "새로고침" },
    },
    config = function(_, opts)
      require("las").setup(opts)
    end,
    opts = {
      api_base_url = "https://las.lafty.org",
      keymaps = {
        enabled = false, -- lazy.nvim keys 사용
      },
    },
  },
}
