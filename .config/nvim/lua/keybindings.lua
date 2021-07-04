local utils = require('utils')

utils.map('n', '<Space>', '')
vim.g.mapleader = ' '

utils.map('i', 'jk', '<Esc>')
utils.map('n', '<leader><esc>', ':nohlsearch<CR>')

-- Telescope
-- Find files using Telescope command-line sugar.
utils.map('n', '<leader>pf', '<cmd>Telescope find_files<CR>')
utils.map('n', '<leader>sp', '<cmd>Telescope live_grep<CR>')
utils.map('n', '<leader>bb', '<cmd>Telescope buffers<CR>')
utils.map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>')

-- Nvim LSP
local lspOpts = { noremap = true, silent = true }
utils.map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', lspOpts)
utils.map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', lspOpts)
utils.map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', lspOpts)
utils.map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', lspOpts)
utils.map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', lspOpts)
utils.map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', lspOpts)
utils.map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', lspOpts)
utils.map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', lspOpts)
utils.map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', lspOpts)
utils.map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', lspOpts)
utils.map('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', lspOpts)

-- Nvim Compe
local compeOpts = { expr = true, silent = true }
utils.map('i', '<C-Space>', 'compe#complete()', compeOpts)
utils.map('i', '<CR>', 'compe#confirm("<CR>")', compeOpts)
