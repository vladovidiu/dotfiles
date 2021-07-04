local utils = require('utils')

local indent = 2

utils.opt('b', 'tabstop', indent)
utils.opt('b', 'softtabstop', indent)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'expandtab', true)
utils.opt('b', 'smartindent', true)
utils.opt('b', 'copyindent', true)
utils.opt('b', 'undofile', true)

utils.opt('o', 'guicursor', '')
utils.opt('o', 'hidden', true)
utils.opt('o', 'swapfile', false)
utils.opt('o', 'backup', false)
utils.opt('o', 'scrolloff', 4)
utils.opt('o', 'completeopt', 'menuone,noselect')
utils.opt('o', 'undodir', tostring(os.getenv("HOME")) .. "/.vim/undodir")
utils.opt('o', 'termguicolors', true)
utils.opt('o', 'showmode', false)
utils.opt('o', 'colorcolumn', '80')
utils.opt('o', 'updatetime', 50)

utils.opt('w', 'listchars',
          'tab:»\\ ,extends:›,precedes:‹,nbsp:·,trail:·,eol:↲')
utils.opt('w', 'list', true)
utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)
utils.opt('w', 'wrap', false)

vim.cmd [[
  set shortmess+=c
  set signcolumn=yes
  let g:netrw_banner=0
]]

utils.create_augroup({
  {'BufWritePre', '*.lua', 'lua vim.lsp.buf.formatting_sync(nil, 100)'}
}, 'luafmt')
