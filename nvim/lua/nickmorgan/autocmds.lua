local nickgroup = vim.api.nvim_create_augroup('NickSettings', { clear = true })
local lspGroup = vim.api.nvim_create_augroup("lsp_completion", { clear = true })

vim.api.nvim_create_autocmd('FileType', {
    group = nickgroup,
    pattern = '*', -- apply to all filetypes
    callback = function()
        -- This fixes annoying auto comments on newline
        vim.opt_local.formatoptions:remove({ 'r', 'o' })
    end,
    desc = 'Disable auto-commenting on new lines'
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = lspGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
    end
})

-- show cursor line only in active window
local cursorline_augroup = vim.api.nvim_create_augroup("cursorline-active-window", { clear = true })
vim.api.nvim_create_autocmd("WinEnter", {
    group = cursorline_augroup,
    callback = function()
        local win = vim.api.nvim_get_current_win()
        -- Schedule to preserve the correct order of events when synchronously
        -- changing between windows a bunch of times (like in `<c-w>t`)
        vim.schedule(function()
            if not vim.api.nvim_win_is_valid(win) then return end
            if not vim.w[win].cached_cursorline then return end

            vim.wo[win].cursorline = vim.w[win].cached_cursorline
            vim.w[win].cached_cursorline = nil
        end)
    end,
})
vim.api.nvim_create_autocmd("WinLeave", {
    group = cursorline_augroup,
    callback = function()
        local win = vim.api.nvim_get_current_win()
        -- Copying the current window options seems to be done after `WinLeave`
        -- when opening a new tab. Delay setting `cursorline` to `false` until
        -- after the options are copied
        vim.schedule(function()
            if not vim.api.nvim_win_is_valid(win) then return end
            vim.w[win].cached_cursorline = vim.wo[win].cursorline
            vim.wo[win].cursorline = false
        end)
    end,
})
