return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "j-hui/fidget.nvim",
      "mfussenegger/nvim-jdtls",
    },

    config = function()
      require("fidget").setup({})

      require("mason").setup({
        registries = {
          "github:mason-org/mason-registry",
          "github:Crashdummyy/mason-registry",
        },
      })

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "gopls",
          "tailwindcss",
          "jdtls",
        },
      })

      -- Enable native completion on LSP attach
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, args.data.client_id, args.buf, { autotrigger = true })
          end
          -- Manual trigger
          vim.keymap.set("i", "<C-Space>", vim.lsp.completion.trigger, { buffer = args.buf })
        end,
      })

      -- Server-specific configurations
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            format = {
              enable = true,
              defaultConfig = {
                indent_style = "space",
                indent_size = "2",
              },
            },
          },
        },
      })

      vim.lsp.config("zls", {
        root_markers = { ".git", "build.zig", "zls.json" },
        settings = {
          zls = {
            enable_inlay_hints = true,
            enable_snippets = true,
            warn_style = true,
          },
        },
      })
      vim.g.zig_fmt_parse_errors = 0
      vim.g.zig_fmt_autosave = 0

      vim.lsp.config("tailwindcss", {
        filetypes = {
          "html", "css", "scss", "javascript", "javascriptreact",
          "typescript", "typescriptreact", "vue", "svelte",
        },
        settings = {
          tailwindCSS = {
            experimental = {
              classRegex = {
                "tw`([^`]*)",
                'tw="([^"]*)',
                'tw={"([^"}]*)',
                "tw\\.\\w+`([^`]*)",
                "tw\\(.*?\\)`([^`]*)",
              },
            },
          },
        },
      })

      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
              shadow = true,
            },
            staticcheck = true,
            gofumpt = true,
            usePlaceholders = true,
            completeUnimported = true,
            matcher = "Fuzzy",
            symbolMatcher = "FastFuzzy",
            codelenses = {
              generate = true,
              gc_details = false,
              test = true,
              tidy = true,
            },
          },
        },
      })

      -- Enable servers (jdtls is handled by nvim-jdtls in ftplugin/java.lua)
      vim.lsp.enable({ "lua_ls", "rust_analyzer", "gopls", "tailwindcss", "zls" })

      vim.diagnostic.config({
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })
    end,
  },
}
