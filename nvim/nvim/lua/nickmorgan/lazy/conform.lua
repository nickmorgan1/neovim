return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
                cs = { "csharpier" },
				lua = { "stylua" },
				go = { "gofmt" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				elixir = { "mix" },
			},
            formatters = {
                ["clang-format"] = {
                    prepend_args = { "-style=file", "-fallback-style=LLVM" },
                },
            },
		})

        vim.keymap.set("n", "<leader>lf", function()
            require("conform").format({ bufnr = 0 })
        end, { desc = "LSP format" })

	end,
}
