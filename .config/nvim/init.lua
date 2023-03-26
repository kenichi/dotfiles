-- https://github.com/folke/lazy.nvim#-installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
require("vimrc")

  --[[
  {
  -- 'hrsh7th/vim-vsnip'
  -- 'hrsh7th/cmp-vsnip'

  --


  {
    -- 'tpope/vim-surround',
    -- 'tpope/vim-repeat',
  }

  -- {'mhanberg/elixir.nvim', requires = {'nvim-lua/plenary.nvim'}}



  -- trying to get matchit for html back :(
  -- {'windwp/nvim-ts-autotag'}


  {'justinmk/vim-dirvish'}
  {}
  {}
  -- {'elixir-editors/vim-elixir'}

  }
)
  --]]

