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
    lazygit = {
      enabled = true,
    },
    picker = {
      enabled = true,
      sources = {
        files = { hidden = true, ignored = true },
      },
    },
    terminal = {
      enabled = true,
    },
  },

  keys = {
    -- Explorer
    {
      "<leader>e",
      function()
        require("snacks").explorer()
      end,
      desc = "Toggle Explorer (sidebar + preview)",
    },
    {
      "<leader>E",
      function()
        require("snacks").explorer.reveal({ focus = "list" })
      end,
      desc = "Reveal in Explorer",
    },

    -- Telescope -> Snacks
    {
      "<leader>pf",
      function()
        require("snacks").picker.files()
      end,
      desc = "find files",
    },
    {
      "<C-p>",
      function()
        require("snacks").picker.git_files()
      end,
      desc = "find git",
    },
    {
      "<leader>pg",
      function()
        require("snacks").picker.git_status()
      end,
      desc = "find git status",
    },
    {
      "<leader>pb",
      function()
        require("snacks").picker.buffers()
      end,
      desc = "find open buffers",
    },
    {
      "<leader>vh",
      function()
        require("snacks").picker.help()
      end,
      desc = "help tags",
    },
    {
      "<leader>pws",
      function()
        require("snacks").picker.grep({ search = vim.fn.expand("<cword>") })
      end,
      desc = "grep current word",
    },
    {
      "<leader>pWs",
      function()
        require("snacks").picker.grep({ search = vim.fn.expand("<cWORD>") })
      end,
      desc = "grep current WORD",
    },
    {
      "<leader>ps",
      function()
        local q = vim.fn.input("Grep > ")
        if q and q ~= "" then
          require("snacks").picker.grep({ search = q })
        end
      end,
      desc = "grep",
    },

    -- ===== LSP (no autocmds) =====
    -- Snacks pickers
    {
      "gd",
      function()
        require("snacks").picker.lsp_definitions()
      end,
      desc = "LSP: definitions",
    },
    {
      "gD",
      function()
        require("snacks").picker.lsp_declarations()
      end,
      desc = "LSP: declarations",
    },
    {
      "gr",
      function()
        require("snacks").picker.lsp_references()
      end,
      desc = "LSP: references",
    },
    {
      "gI",
      function()
        require("snacks").picker.lsp_implementations()
      end,
      desc = "LSP: implementations",
    },
    {
      "gy",
      function()
        require("snacks").picker.lsp_type_definitions()
      end,
      desc = "LSP: type definitions",
    },
    {
      "<leader>vws",
      function()
        require("snacks").picker.lsp_workspace_symbols()
      end,
      desc = "LSP: workspace symbols",
    },
    {
      "<leader>vd",
      function()
        require("snacks").picker.diagnostics_buffer()
      end,
      desc = "Diagnostics (buffer)",
    },
    {
      "<leader>sd",
      function()
        require("snacks").picker.diagnostics()
      end,
      desc = "Diagnostics",
    },

    -- Native keepers
    {
      "K",
      function()
        vim.lsp.buf.hover()
      end,
      desc = "LSP: hover",
    },
    {
      "<leader>vca",
      function()
        vim.lsp.buf.code_action()
      end,
      desc = "LSP: code action",
    },
    {
      "<C-h>",
      function()
        vim.lsp.buf.signature_help()
      end,
      mode = "i",
      desc = "LSP: signature help",
    },

    -- lazygit
    {
      "<leader>lg",
      function()
        require("snacks").lazygit.open()
      end,
      desc = "Open Lazygit",
    },
        {
            "<leader>tt",
            function()
                require("snacks").terminal.open()
            end,
            desc = "Open Terminal",
        },
  },
}
