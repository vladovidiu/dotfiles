local lspconfig = require('lspconfig')

local shfmt = require('lsp.formatters.sh')
local shellcheck = require('lsp.formatters.shellcheck')
local luafmt = require('lsp.formatters.luafmt')
local eslint = require('lsp.formatters.eslint')
local prettier = require('lsp.formatters.prettier')

local on_attach = function(client)
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api
        .nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]]
    vim.api.nvim_command [[augroup END]]
  end
end

lspconfig.efm.setup {
  on_attach = on_attach,
  init_options = {documentFormatting = true},
  filetypes = {"lua", "sh", "css", "yaml", "json"},
  settings = {
    rootMarkers = {'.git/'},
    languages = {
      lua = {luafmt},
      sh = {shfmt, shellcheck},
      css = {prettier},
      yaml = {prettier},
      json = {prettier, eslint}
    }
  }
}
