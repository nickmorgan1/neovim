return {
  "folke/snacks.nvim",
  lazy = false,
  opts = {
    explorer = {
      enabled = true,
      replace_netrw = true,
      hidden = true,
      ignored = true,
      follow_file = true,
      auto_close = false,
      git_status = true,
      git_untracked = true,
      exclude = { "node_modules", "coverage" },
      focus = "list",
      diagnostics_open = true,
      layout = {
        preset = "sidebar",
        width = 30,
        preview = { enabled = true, position = "right", width = 0.65 },
      },
    },
    gitbrowse = { enabled = true },
    lazygit = { enabled = true },
    picker = {
      enabled = true,
      sources = {
        files = { hidden = true, ignored = true },
      },
      win = {
        preview = { enabled = true },
      },
    },
    terminal = { enabled = true },
  },

  keys = {
    -- ===== Explorer =====
    { "<leader>e", function() require("snacks").explorer() end, desc = "Explorer toggle" },
    { "<leader>E", function() require("snacks").explorer.reveal({ focus = "list" }) end, desc = "Explorer reveal" },

    -- ===== Find (pickers) =====
    { "<leader>ff", function() require("snacks").picker.files() end, desc = "Find files" },
    { "<leader>fb", function() require("snacks").picker.buffers() end, desc = "Find buffers" },
    { "<leader>fh", function() require("snacks").picker.help() end, desc = "Find help" },
    { "<leader>fw", function() require("snacks").picker.grep({ search = vim.fn.expand("<cword>") }) end, desc = "Find word" },
    { "<leader>fW", function() require("snacks").picker.grep({ search = vim.fn.expand("<cWORD>") }) end, desc = "Find WORD" },
    { "<leader>fg", function()
        local q = vim.fn.input("Grep > ")
        if q and q ~= "" then require("snacks").picker.grep({ search = q }) end
      end, desc = "Find grep" },

    -- ===== Git =====
    { "<C-p>", function() require("snacks").picker.git_files() end, desc = "Git files" },
    { "<leader>gs", function() require("snacks").picker.git_status() end, desc = "Git status" },
    { "<leader>gg", function() require("snacks").lazygit.open() end, desc = "Git lazygit" },
    { "<leader>go", function() require("snacks").gitbrowse.open({ what = "permalink" }) end, desc = "Git open permalink" },
    { "<leader>gO", function() require("snacks").gitbrowse.open({ what = "repo" }) end, desc = "Git open repo" },
    { "<leader>gY", function() require("snacks").gitbrowse.open({ open = function(url) vim.fn.setreg("+", url) end, notify = false }) end, desc = "Git yank url" },

    -- ===== LSP navigation (g-prefix) =====
    { "gd", function() require("snacks").picker.lsp_definitions() end, desc = "LSP definitions" },
    { "gD", function() require("snacks").picker.lsp_declarations() end, desc = "LSP declarations" },
    { "gI", function() require("snacks").picker.lsp_implementations() end, desc = "LSP implementations" },
    { "gy", function() require("snacks").picker.lsp_type_definitions() end, desc = "LSP type defs" },

    -- ===== LSP actions (leader-l) =====
    { "K", function() vim.lsp.buf.hover() end, desc = "LSP hover" },
    { "<leader>lr", function() require("snacks").picker.lsp_references() end, desc = "LSP references" },
    { "<leader>ls", function() require("snacks").picker.lsp_workspace_symbols() end, desc = "LSP symbols" },
    { "<leader>la", function() vim.lsp.buf.code_action() end, desc = "LSP action" },
    { "<leader>ln", function() vim.lsp.buf.rename() end, desc = "LSP rename" },
    { "<leader>ld", function() require("snacks").picker.diagnostics_buffer() end, desc = "LSP diagnostics" },
    { "<C-h>", function() vim.lsp.buf.signature_help() end, mode = "i", desc = "LSP signature" },

    -- ===== Terminal =====
    { "<leader>tt", function() require("snacks").terminal.open() end, desc = "Terminal" },
  },
}
