return {
  "coder/claudecode.nvim",
  opts = {
    terminal_cmd = "cbcode",
  },

  keys = {
    -- ===== Claude Code =====
    { "<leader>cc", "<cmd>ClaudeCode<cr>", desc = "Claude toggle" },
    { "<leader>cs", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Claude send selection" },
    { "<leader>ca", "<cmd>ClaudeCodeAdd %<cr>", desc = "Claude add file" },
  },
}
