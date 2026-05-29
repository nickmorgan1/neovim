vim.api.nvim_create_user_command('LSPFormat', function()
  vim.lsp.buf.format()
end, { desc = 'Format the file using the LSP support' })
