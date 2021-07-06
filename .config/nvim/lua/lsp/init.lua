require('lsp.tsserver')
require('lsp.sumneko_lua')
require('lsp.efm')

vim.fn.sign_define("LspDiagnosticsSignError",
                   {text = "", texthl = "GruvboxRed"})
vim.fn.sign_define("LspDiagnosticsSignWarning",
                   {text = "", texthl = "GruvboxYellow"})
vim.fn.sign_define("LspDiagnosticsSignInformation",
                   {text = "", texthl = "GruvboxBlue"})
vim.fn.sign_define("LspDiagnosticsSignHint",
                   {text = "", texthl = "GruvboxAqua"})

