local status_ok, phpactor = pcall(require, "phpactor")
if not status_ok then
    return
end

phpactor.setup {
    install = {
        path = vim.fn.stdpath("data") .. "/opt/",
        branch = "master",
        bin = "/usr/bin/phpactor",
        php_bin = "php",
        composer_bin = "composer",
        git_bin = "git",
        check_on_startup = "none",
    },
    lspconfig = {
        -- PhpActor is already enabled as a LSP server in lspconfig. All we want need from this plugin are the commands
        enabled = false,
        options = {},
    },
}
