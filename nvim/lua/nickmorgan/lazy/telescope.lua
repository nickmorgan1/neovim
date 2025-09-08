return {
  "nvim-telescope/telescope.nvim",

  tag = "0.1.5",

  dependencies = {
    "nvim-telescope/telescope-live-grep-args.nvim",
    "nvim-lua/plenary.nvim",
  },

  config = function()
    local telescope = require("telescope")
    telescope.setup({})

    telescope.load_extension("live_grep_args")

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "find files" })
    vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "find git" })
    vim.keymap.set("n", "<leader>pws", function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end, { desc = "grep current word" })
    vim.keymap.set("n", "<leader>pWs", function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end, { desc = "grep current WORD" })
    vim.keymap.set("n", "<leader>ps", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end, { desc = "grep" })
    vim.keymap.set("n", "<leader>pg", telescope.extensions.live_grep_args.live_grep_args, { desc = "grep with args" })
    vim.keymap.set("n", "<leader>vh", builtin.help_tags, { desc = "help tags" })
  end,
}
