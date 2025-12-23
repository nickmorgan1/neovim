return {
  {
    "ellisonleao/gruvbox.nvim",
    },
  {
    "neanias/everforest-nvim",
    config = function()
      require("everforest").setup({
        background = "soft",
        ui_contrast = "high",
        on_highlights = function(_, _) end,
        colours_override = function(_) end,
      })
      vim.cmd.colorscheme("gruvbox")
    end,
  },
}
