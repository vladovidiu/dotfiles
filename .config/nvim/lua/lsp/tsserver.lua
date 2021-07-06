local lspconfig = require('lspconfig')

require("null-ls").setup {}

local on_attach = function(client, bufnr)
  client.resolved_capabilities.document_formatting = false

  local ts_utils = require("nvim-lsp-ts-utils")

  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  -- config
  ts_utils.setup {
    debug = false,
    disable_commands = false,
    enable_import_on_completion = true,
    import_all_timeout = 5000,

    -- eslint
    eslint_enable_code_actions = true,
    eslint_enable_disable_comments = true,
    eslint_bin = "eslint_d",
    eslint_config_fallback = nil,
    eslint_enable_diagnostics = true,

    -- formatting
    enable_formatting = true,
    formatter = "prettier",
    formatter_config_fallback = nil,

    -- parentheses completion
    complete_parens = false,
    signature_help_in_parens = true,

    -- update imports on file move
    update_imports_on_move = true,
    require_confirmation_on_move = true,
    watch_dir = nil
  }

  ts_utils.setup_client(client)

  local opts = {silent = true}

  buf_set_keymap('n', 'gs', ':TSLspOrganize<CR>', opts)
  buf_set_keymap('n', 'qq', ':TSLspFixCurrent<CR>', opts)
  buf_set_keymap('n', 'gr', ':TSLspRenameFile<CR>', opts)
  buf_set_keymap('n', 'gi', ':TSLspImportAll<CR>', opts)

  vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
  vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
end

lspconfig.tsserver.setup {
  on_attach = on_attach,

  filetypes = {
    "typescript", "typescriptreact", "typescript.tsx", "javascript",
    "javascriptreact", "javascript.tsx"
  }
}

