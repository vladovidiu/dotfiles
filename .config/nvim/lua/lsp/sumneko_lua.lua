local lspconfig = require('lspconfig')

USER = vim.fn.expand("$USER")

local sumneko_root_path = "/home/" .. USER .. "/Developer/lua-language-server"
local sumneko_binary = "/home/" .. USER
                           .. "/Developer/lua-language-server/bin/Linux/lua-language-server"

lspconfig.sumneko_lua.setup {
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

