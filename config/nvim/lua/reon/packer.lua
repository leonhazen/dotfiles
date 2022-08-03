local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)

  -- make sure to add this line to let packer manage itself
  use 'wbthomason/packer.nvim'

  -- theme
  use 'folke/tokyonight.nvim'

  -- glow for markdown previews - requires glow to be installed
  use 'ellisonleao/glow.nvim'

  -- treesitter for syntax parsing
  use {
    'nvim-treesitter/nvim-treesitter',
      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- telescrope for file browsing
  -- TODO: Key mappings - see https://github.com/nvim-telescope/telescope-file-browser.nvim
  use { "nvim-telescope/telescope-file-browser.nvim" }

  -- TODO: review these other plugins
  -- nvim-telescope/telescope.nvim
  -- nvim-lua/popup.nvim
  -- nvim-lua/plenary.nvim
  -- nvim-telescope/telescope-fzf-native.nvim
  -- sindrets/diffview.nvim
  -- folke/todo-comments.nvim
  -- kyazdani42/nvim-web-devicons
  -- mattn/emmet-vim
  -- neovim/nvim-lspconfig
  --

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
