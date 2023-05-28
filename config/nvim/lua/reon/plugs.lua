local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)

  -- make sure to add this line to let packer manage itself
  use 'wbthomason/packer.nvim'

  -- filesystem nav tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'        -- filesystem icons
  }

  -- styling
  use { 'mhinz/vim-startify' }                       -- start screen
  use { 'DanilaMihailov/beacon.nvim' }               -- cursor jump
  use {
    'nvim-lualine/lualine.nvim',                     -- statusline
    requires = {'kyazdani42/nvim-web-devicons',
                opt = true}
  }
  use("akinsho/bufferline.nvim")                     -- bufferline
  use { 'Mofiqul/dracula.nvim' }                     -- colorscheme

  -- glow for markdown previews - requires glow to be installed
  use 'ellisonleao/glow.nvim'

  -- formatting
  use("jose-elias-alvarez/null-ls.nvim") -- TODO: configure this

  -- language server
  use("neovim/nvim-lspconfig")
  use("williamboman/nvim-lsp-installer")

  -- treesitter for syntax parsing
  use {
    'nvim-treesitter/nvim-treesitter',
      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  use { 'majutsushi/tagbar' }                        -- code structure
  use { 'Yggdroot/indentLine' }                      -- see indentation
  use { 'tpope/vim-fugitive' }                       -- git integration
  use { 'junegunn/gv.vim' }                          -- commit history
  use { 'windwp/nvim-autopairs' }                    -- auto close brackets, etc.
  
  -- telescrope for file finding and browsing
  use {
    'nvim-telescope/telescope.nvim',                
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- TODO: Key mappings - see https://github.com/nvim-telescope/telescope-file-browser.nvim
  use { "nvim-telescope/telescope-file-browser.nvim" }

  -- TODO: review these other plugins
  -- -- Completion
  -- use("hrsh7th/cmp-buffer")
  -- use("hrsh7th/cmp-cmdline")
  -- use("hrsh7th/cmp-nvim-lsp")
  -- use("hrsh7th/cmp-path")
  -- use("hrsh7th/nvim-cmp")
  -- -- Motor de snippets
  -- use("L3MON4D3/LuaSnip")
  -- use("saadparwaiz1/cmp_luasnip")

  -- use("norcalli/nvim-colorizer.lua") -- show colour codes in colour

  -- nvim-lua/popup.nvim
  -- nvim-lua/plenary.nvim
  -- nvim-telescope/telescope-fzf-native.nvim
  -- sindrets/diffview.nvim
  -- folke/todo-comments.nvim
  -- kyazdani42/nvim-web-devicons
  -- mattn/emmet-vim
  -- neovim/nvim-lspconfig
  --voldikss/vim-floaterm 
  --mrjones2014/smart-splits.nvim
  -- nvim-neo-tree/neo-tree.nvim instead of nvim-tree

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
