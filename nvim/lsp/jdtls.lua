local mason_path = vim.fn.stdpath('data') .. '/mason/packages/jdtls'
local launcher = vim.fn.glob(mason_path .. '/plugins/org.eclipse.equinox.launcher_*.jar')
local os_config = vim.uv.os_uname().sysname == 'Darwin' and 'config_mac' or 'config_linux'

return {
    cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.level=ALL',
        '-Xmx1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-jar', launcher,
        '-configuration', mason_path .. '/' .. os_config,
        '-data', '',
    },
    filetypes = { 'java' },
    root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' },
    before_init = function(_, config)
        local project = vim.fn.fnamemodify(config.root_dir, ':t')
        config.cmd[#config.cmd] = vim.fn.stdpath('cache') .. '/jdtls/' .. project
    end,
    settings = {
        java = {
            eclipse = { downloadSources = true },
            maven = { downloadSources = true },
            signatureHelp = { enabled = true },
            configuration = { updateBuildConfiguration = 'interactive' },
        },
    },
}
