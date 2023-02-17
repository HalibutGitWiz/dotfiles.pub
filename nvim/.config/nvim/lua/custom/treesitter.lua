local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  indent = { enable = true },
}
