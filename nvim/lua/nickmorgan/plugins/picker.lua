-- Fuzzy selection for files and more, see plugin settings for keymaps.
local map = vim.keymap.set

local pickers = {
    quickfix = function()
        require('mini.pick').start({
            source = {
                items = vim.fn.getqflist(),
                name = 'Quickfix List'
            }
        })
    end
}

return {
    src = 'https://github.com/nvim-mini/mini.pick',
    data = {
        setup = function()
            local picker = require('mini.pick')
            -- Bind keys enabling quick access to pickers
            pickers = vim.tbl_extend('force', pickers, picker.builtin)
            picker.registry = pickers
            map('n', '<leader>ff', pickers.files, { desc = 'Find Files' })
            map('n', '<leader>fr', pickers.resume, { desc = 'Resume' })
            map('n', '<leader>fg', pickers.grep, { desc = 'Grep Files' })
            map('n', '<leader>fb', pickers.buffers, { desc = 'Buffers' })
            map('n', '<leader>fl', pickers.grep_live, { desc = 'Grep Live' })
            map('n', '<leader>fq', pickers.quickfix, { desc = 'Quickfix' })
            map('n', '<leader>fh', pickers.help, { desc = 'Help Tags' })

            picker.setup({
                -- Window related options
                window = {
                    config = function()
                        local height, width, starts, ends
                        local win_width = vim.o.columns
                        local win_height = vim.o.lines

                        if win_height <= 25 then
                            height = math.min(win_height, 18)
                            width = win_width
                            starts = 1
                            ends = win_height
                        else
                            width = math.floor(win_width * 0.5) -- 50%
                            height = math.floor(win_height * 0.3) -- 30%
                            starts = math.floor((win_width - width) / 2)
                            -- center prompt: height * (50% + 30%)
                            -- center window: height * [50% + (30% / 2)]
                            ends = math.floor(win_height * 0.65)
                        end

                        return {
                            col = starts,
                            row = ends,
                            height = height,
                            width = width,
                            style = 'minimal',
                            border = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
                        }
                    end,

                    -- String to use as cursor in prompt
                    prompt_caret = '|',

                    -- String to use as prefix in prompt
                    prompt_prefix = '',
                },
            })
        end,
    }
}
