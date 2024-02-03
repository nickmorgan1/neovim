return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    init = function()
      if vim.fn.argc(-1) == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,
    cmd = 'Neotree',
    keys = {
    -- {
    --   "<leader>hg",
    --   "<cmd>Neotree git_status<CR>",
    --   "n",
    --   { nowait = true, noremap = true, silent = true, desc = "git status" },
    -- },
    {
      "<leader>e",
      "<cmd>Neotree reveal toggle<CR>",
      "n",
      { noremap = true, silent = true, desc = "neo-tree toggle" },
    },
    {
      "<leader>E",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
  },
    config = function()
      require('neo-tree').setup {
        sources = {
          'filesystem',
          'buffers',
          'git_status',
          'document_symbols',
        },
        auto_clean_after_session_restore = true,
        close_if_last_window = true,
        source_selector = {
          winbar = true,
          sources = {
            { source = 'filesystem', display_name = ' 󰉓  Files ' },
            { source = 'git_status', display_name = ' 󰊢  Git ' },
            { source = 'buffers', display_name = ' 󰗚  Buffers ' },
            { source = 'document_symbols', display_name = '   Symbols ' },
          },
        },
        filesystem = {
          follow_current_file = { enabled = true },
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {
              'node_modules',
            },
            never_show = {
              '.DS_Store',
              'thumbs.db',
            },
          },
        },
        default_component_configs = {
          icon = {
            folder_empty = '󰜌',
            folder_empty_open = '󰜌',
          },
          git_status = {
            symbols = {
              renamed = '󰁕',
              unstaged = '󰄱',
            },
          },
        },
        document_symbols = {
          kinds = {
            File = { icon = '󰈙', hl = 'Tag' },
            Namespace = { icon = '󰌗', hl = 'Include' },
            Package = { icon = '󰏖', hl = 'Label' },
            Class = { icon = '󰌗', hl = 'Include' },
            Property = { icon = '󰆧', hl = '@property' },
            Enum = { icon = '󰒻', hl = '@number' },
            Function = { icon = '󰊕', hl = 'Function' },
            String = { icon = '󰀬', hl = 'String' },
            Number = { icon = '󰎠', hl = 'Number' },
            Array = { icon = '󰅪', hl = 'Type' },
            Object = { icon = '󰅩', hl = 'Type' },
            Key = { icon = '󰌋', hl = '' },
            Struct = { icon = '󰌗', hl = 'Type' },
            Operator = { icon = '󰆕', hl = 'Operator' },
            TypeParameter = { icon = '󰊄', hl = 'Type' },
            StaticMethod = { icon = '󰠄 ', hl = 'Function' },
          },
        },
      }   
      vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
      end,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
}
