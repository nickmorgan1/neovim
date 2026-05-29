return { cmd = { 'gopls' }, filetypes = { 'go', 'gomod', 'gowork', 'gotmpl', 'gosum' },
    root_markers = { 'go.mod' },
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
}
