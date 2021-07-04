local ts_on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local opts = {noremap = true, silent = true}

  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)

  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api
        .nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end
end

require'lspconfig'.tsserver.setup {
  on_attach = ts_on_attach,
  filetypes = {
    "typescript", "typescriptreact", "typescript.tsx", "javascript",
    "javascriptreact", "javascript.tsx"
  }
}

USER = vim.fn.expand("$USER")

local sumneko_root_path = "/home/" .. USER .. "/Developer/lua-language-server"
local sumneko_binary = "/home/" .. USER
                           .. "/Developer/lua-language-server/bin/Linux/lua-language-server"

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of lua you are using
        version = 'LuaJIT',
        path = vim.split(package.path, ';')
      },
      diagnostics = {globals = {'vim', 'use'}},
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
        }
      }
    }
  }
}

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

