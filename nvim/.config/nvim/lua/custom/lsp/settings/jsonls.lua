local opts = {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas {
        select = {
          'composer.json',
          'package.json',
        },
      },
      validate = { enable = true },
    },
  },
  setup = {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
        end,
      },
    },
  },
}

return opts
