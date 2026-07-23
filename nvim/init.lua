require('vim._core.ui2').enable({})

require('nickmorgan')

vim.pack.add({
    { src = 'https://github.com/mason-org/mason.nvim' },
    { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
})

local lsp_servers = {
    'clangd',
    'rust_analyzer',
    'lua_ls',
    'gopls',
    'jdtls',
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

vim.pack.add({ { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } })

require('catppuccin').setup({
  transparent_background = true,
  integrations = {
    treesitter = true,
    native_lsp = { enabled = true },
    mason = true,
    which_key = true,
  },
})

-- Matches Ghostty's dynamic light/dark theme (Catppuccin Latte / Frappe).
-- Re-run on demand (see bin/toggle-theme) to pick up a live appearance change.
local function apply_system_theme()
    local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
    local result = handle:read("*a")
    handle:close()

    -- Strip trailing newline character
    result = string.gsub(result, "\n$", "")

    if result == "Dark" then
        vim.o.background = "dark"
        vim.cmd("colorscheme catppuccin-frappe")
    else
        vim.o.background = "light"
        vim.cmd("colorscheme catppuccin-latte")
    end
end

apply_system_theme()

-- bin/toggle-theme sends SIGUSR1 to running nvim processes after flipping
-- the macOS appearance, so open buffers re-theme without a restart.
local theme_signal = vim.uv.new_signal()
theme_signal:start("sigusr1", function()
    vim.schedule(apply_system_theme)
end)

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
