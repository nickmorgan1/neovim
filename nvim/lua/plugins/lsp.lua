return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "tsserver",
                "gopls",
                "yamlls",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,
                ["gopls"] = function ()
                  local lspconfig = require("lspconfig")
                  lspconfig.gopls.setup {
                    capabilities = capabilities,
                    settings = {
                    }
                  }
                end,
                ["yamlls"] = function ()
                  local lspconfig = require("lspconfig")
                  lspconfig.yamlls.setup {
                    yaml = {
                      schemaStore = {
                        enable = true
                      },
                      customTags = {
                        "!And scalar", "!And mapping", "!And sequence", "!If scalar",
                        "!If mapping", "!If sequence", "!Not scalar", "!Not mapping",
                        "!Not sequence", "!Equals scalar", "!Equals mapping",
                        "!Equals sequence", "!Or scalar", "!Or mapping", "!Or sequence",
                        "!FindInMap scalar", "!FindInMap mappping",
                        "!FindInMap sequence", "!Base64 scalar", "!Base64 mapping",
                        "!Base64 sequence", "!Cidr scalar", "!Cidr mapping",
                        "!Cidr sequence", "!Ref scalar", "!Ref mapping",
                        "!Ref sequence", "!Sub scalar", "!Sub mapping", "!Sub sequence",
                        "!GetAtt scalar", "!GetAtt mapping", "!GetAtt sequence",
                        "!GetAZs scalar", "!GetAZs mapping", "!GetAZs sequence",
                        "!ImportValue scalar", "!ImportValue mapping",
                        "!ImportValue sequence", "!Select scalar", "!Select mapping",
                        "!Select sequence", "!Split scalar", "!Split mapping",
                        "!Split sequence", "!Join scalar", "!Join mapping",
                        "!Join sequence", "!reference sequence", "!reference scalar"
                      },
                      format = { enable = true }
                    }
                  }
              end,
            }
        })
        vim.api.nvim_create_autocmd("BufWritePre", {
          pattern = "*.go",
          callback = function()
            local params = vim.lsp.util.make_range_params()
            params.context = {only = {"source.organizeImports"}}
            -- buf_request_sync defaults to a 1000ms timeout. Depending on your
            -- machine and codebase, you may want longer. Add an additional
            -- argument after params if you find that you have to write the file
            -- twice for changes to be saved.
            -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
            local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
            for cid, res in pairs(result or {}) do
              for _, r in pairs(res.result or {}) do
                if r.edit then
                  local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                  vim.lsp.util.apply_workspace_edit(r.edit, enc)
                end
              end
            end
            vim.lsp.buf.format({async = false})
          end
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}

