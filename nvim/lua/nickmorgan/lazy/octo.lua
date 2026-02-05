return {
  "pwntester/octo.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Octo",
  keys = {
    -- ===== GitHub PRs (leader-gp) =====
    { "<leader>gpl", "<cmd>Octo pr list<cr>", desc = "PR list" },
    { "<leader>gpc", "<cmd>Octo pr checks<cr>", desc = "PR checks" },
    { "<leader>gpd", "<cmd>Octo pr diff<cr>", desc = "PR diff" },
    { "<leader>gpm", "<cmd>Octo pr merge<cr>", desc = "PR merge" },
    { "<leader>gpr", "<cmd>Octo review start<cr>", desc = "PR review start" },
    { "<leader>gps", "<cmd>Octo review submit<cr>", desc = "PR review submit" },
    { "<leader>gpx", "<cmd>Octo review close<cr>", desc = "PR review close" },
    { "<leader>gpa", "<cmd>Octo pr ready<cr>", desc = "PR mark ready" },

    -- ===== GitHub Issues (leader-gi) =====
    { "<leader>gil", "<cmd>Octo issue list<cr>", desc = "Issue list" },
    { "<leader>gic", "<cmd>Octo issue create<cr>", desc = "Issue create" },
    { "<leader>gis", "<cmd>Octo issue search<cr>", desc = "Issue search" },

    -- ===== Comments (leader-gc) =====
    { "<leader>gca", "<cmd>Octo comment add<cr>", desc = "Comment add" },
    { "<leader>gcd", "<cmd>Octo comment delete<cr>", desc = "Comment delete" },

    -- ===== Reactions (leader-gr) =====
    { "<leader>grp", "<cmd>Octo reaction thumbs_up<cr>", desc = "React +1" },
    { "<leader>grm", "<cmd>Octo reaction thumbs_down<cr>", desc = "React -1" },
  },
  opts = {
    use_local_fs = true,
    enable_builtin = true,
    default_to_resolve_thread = true,
    picker = "snacks",
  },
}
