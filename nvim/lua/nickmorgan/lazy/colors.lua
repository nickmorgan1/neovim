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
    end,
  },
  {
    "loctvl842/monokai-pro.nvim",
    priority = 1000,
    config = function()
      require("monokai-pro").setup({
        filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
      })
      vim.cmd.colorscheme("monokai-vibrant")
    end,
  },
}
