require('lsp.tsserver')
require('lsp.sumneko_lua')

require'lspconfig'.efm.setup {
  init_options = {documentFormatting = true},
  filetypes = {"lua"},
  settings = {
    rootMarkers = {'.git/'},
    languages = {
      lua = {
        {
          formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --indent-width=2 --column-limit=80 --break-after-table-lb",
          formatStdin = true
        }
      }
    }
  }
}

vim.fn.sign_define("LspDiagnosticsSignError",
                   {text = "", texthl = "GruvboxRed"})
vim.fn.sign_define("LspDiagnosticsSignWarning",
                   {text = "", texthl = "GruvboxYellow"})
vim.fn.sign_define("LspDiagnosticsSignInformation",
                   {text = "", texthl = "GruvboxBlue"})
vim.fn.sign_define("LspDiagnosticsSignHint",
                   {text = "", texthl = "GruvboxAqua"})

