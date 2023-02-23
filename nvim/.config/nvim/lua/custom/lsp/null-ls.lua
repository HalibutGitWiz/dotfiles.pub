local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
  debug = false,
  sources = {

    -- PHP
    diagnostics.phpcs.with { extra_args = { '--standard=PSR12'} },
    diagnostics.phpmd.with { extra_args = { vim.fn.expand("~/.config/nvim/lua/custom/lsp/settings/phpmd.xml")} },
    diagnostics.phpstan,
    formatting.phpcbf.with { extra_args = { '--standard=PSR12'} },

    -- SQL
    -- TODO : configure SqlFluff, default rules are weird
    -- diagnostics.sqlfluff.with { extra_args = { "--dialect", "mysql" }},
    -- formatting.sqlfluff.with { extra_args = { "--dialect", "mysql" }}
  },
}
