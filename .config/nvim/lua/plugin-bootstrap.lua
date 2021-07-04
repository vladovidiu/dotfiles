local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute(
      '!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
  use {'wbthomason/packer.nvim'}

  use {
    'npxbr/gruvbox.nvim',
    requires = {'rktjmp/lush.nvim'},
    config = function()
      vim.cmd [[
      colorscheme gruvbox
      hi Normal guibg=NONE ctermbg=NONE
    ]]
    end
  }

  use {'neovim/nvim-lspconfig'}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  use {'hrsh7th/nvim-compe'}
  use {'svermeulen/vimpeccable'}

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  use {'onsails/lspkind-nvim'}

end)
