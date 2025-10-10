return {
    'nvim-mini/mini.nvim',
    version = false,
    config = function ()
        require('mini.ai').setup({})
--[[        require('mini.files').setup({
          use_as_default_explorer = true,
          windows = {
            max_number = math.huge,
            preview = false,
            width_focus = 30,
            width_nofocus = 20,
            width_preview = 25,
          },
        })]]
        require('mini.icons').setup({})
        require('mini.operators').setup({})
        require('mini.surround').setup({})
    end
}
