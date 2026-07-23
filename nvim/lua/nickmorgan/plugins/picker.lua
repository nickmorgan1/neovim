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
    end,
    git_status = function()
        local selection = require('mini.pick').builtin.cli({
            command = {
                'git', 'status', '-s'
            }
        }, {
            source = {
                name = 'Git Status',
                preview = function(bufnr, item)
                    local file = vim.trim(item):match('%s+(.+)')
                    -- get diff and show
                    local append_data = function(_, data)
                        if data then
                            vim.bo[bufnr].modifiable = true
                            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, data)
                            vim.bo[bufnr].filetype = 'diff'
                            vim.bo[bufnr].modifiable = false
                        end
                    end

                    vim.fn.jobstart({ 'git', 'diff', 'HEAD', file }, {
                        stdout_buffered = true,
                        on_stdout = append_data,
                        on_stderr = append_data,
                    })
                end
            }
        })

        if selection then
            vim.cmd.edit(vim.trim(selection):match('%s+(.+)'))
        end
    end,
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
            map('n', '<leader>fb', pickers.buffers, { desc = 'Buffers' })
            map('n', '<leader>fl', pickers.grep_live, { desc = 'Grep Live' })
            map('n', '<leader>fq', pickers.quickfix, { desc = 'Quickfix' })
            map('n', '<leader>fh', pickers.help, { desc = 'Help Tags' })
            map('n', '<leader>fg', pickers.git_status, { desc = 'Git Status' })

            picker.setup({
                -- Window related options
                window = {
                    config = function()
                        local width = math.floor(vim.o.columns * 0.75)
                        local height = math.floor(vim.o.lines * 0.75)

                        return {
                            anchor = 'NW',
                            col = math.floor((vim.o.columns - width) / 2),
                            row = math.floor((vim.o.lines - height) / 2),
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
