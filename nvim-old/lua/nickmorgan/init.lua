require("nickmorgan.remap")
require("nickmorgan.options")
require("nickmorgan.lazy_init")

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

local augroup = vim.api.nvim_create_augroup
local NickMorganGroup = augroup('NickMorgan', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd("BufWritePre", {
    group = NickMorganGroup,
    pattern = "*",
    callback = function()
        -- Save the view (cursor position, folds, etc.)
        local save = vim.fn.winsaveview()

        -- Restrict substitution to modified lines only
        vim.cmd([[
            silent! keeppatterns %s/\s\+$//e
            silent! keeppatterns g/^\%#\%V/ s/\s\+$//e
        ]])

        -- Restore the view
        vim.fn.winrestview(save)
    end,
})
