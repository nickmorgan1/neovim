require('vim._core.ui2').enable({})

require('nickmorgan')

vim.pack.add({
    { src = 'https://github.com/mason-org/mason.nvim' },
    { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
})

local lsp_servers = {
    'pylsp',
    'clangd',
    'zls',
    'rust_analyzer',
    'lua_ls',
    'ts_ls',
    'gopls',
}

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = lsp_servers,
    automatic_enable = false,
})

-- Enable snippets (built in)
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config('*', {
    capabilities = capabilities,
})

-- Enable LSP completion (this connects LSP to the native menu)

local function has_lsp_config(server_name)
    local config_path = vim.fn.stdpath("config")
    local target_path = vim.fs.joinpath(config_path, "lsp", server_name .. ".lua")
    if vim.uv.fs_stat(target_path) then
        return true
    else
        return false
    end
end

vim.iter(lsp_servers):each(
    function(lsp_server)
        if not has_lsp_config(lsp_server) then
            vim.api.nvim_echo(
            { { 'Warning. lsp server ' .. lsp_server .. ' has no config file in the config lsp folder.', 'WarningMsg' } },
                true, {})
        else
            vim.lsp.enable(lsp_server)
        end
    end
)

-- Treesitter

require('nvim-treesitter.config').setup({
    install_dir = vim.fn.stdpath('data') .. '/site',
})

vim.pack.add({
    {
    src = 'https://github.com/rose-pine/neovim',
    name = 'rose-pine',
}
})

vim.cmd('colorscheme rose-pine-moon')

-- Colorizer shows html and other colour encodings in their colour
vim.pack.add({
    { src = 'https://github.com/NvChad/nvim-colorizer.lua' },
})

require 'colorizer'.setup {
    'css',
    'javascript',
    html = {
        mode = 'foreground',
    }
}

-- Small selection of mini plugins
vim.pack.add({
    {
        src = 'https://github.com/nvim-mini/mini.extra',
        version = 'main',
    } })

vim.pack.add({
    {
        src = 'https://github.com/nvim-mini/mini.icons',
        version = 'main',
    } })

--because I forget my own config
vim.pack.add({
    { src = 'https://github.com/folke/which-key.nvim' }
})
