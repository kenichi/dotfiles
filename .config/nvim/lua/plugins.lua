require('packer').startup(function(use)
  use {'wbthomason/packer.nvim'}
  use {'neovim/nvim-lspconfig'}
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/cmp-cmdline'}
  -- use {'hrsh7th/vim-vsnip'}
  -- use {'hrsh7th/cmp-vsnip'}
  use {'nvim-treesitter/nvim-treesitter'}

  --

  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = {'nvim-lua/plenary.nvim'}
  }
  use {
    'nvim-neotest/neotest',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
      'jfpedroza/neotest-elixir'
    }
  }
  use {'direnv/direnv.vim'}

  use {
    'tpope/vim-commentary',
    -- 'tpope/vim-surround',
    -- 'tpope/vim-repeat',
    'tpope/vim-fugitive'
  }
  use {'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim'}
  use {'lewis6991/gitsigns.nvim', tag = 'v0.6'}

  -- use {'mhanberg/elixir.nvim', requires = {'nvim-lua/plenary.nvim'}}

  use {'rebelot/kanagawa.nvim'}

  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim'
  }

  use {'folke/tokyonight.nvim'}

  use {'rcarriga/nvim-notify'}

  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  use {'akinsho/toggleterm.nvim', tag = '2.4.0'}
  -- use {'nvim-tree/nvim-tree.lua', requires = 'nvim-tree/nvim-web-devicons'}

  use {'marko-cerovac/material.nvim'}

  -- trying to get matchit for html back :(
  -- use {'windwp/nvim-ts-autotag'}

  use {'metalelf0/jellybeans-nvim', requires = 'rktjmp/lush.nvim'}

  use {'justinmk/vim-dirvish'}
  use {'neanias/everforest-nvim'}
  use {'kylechui/nvim-surround'}
  -- use {'elixir-editors/vim-elixir'}
  use {'AndrewRadev/splitjoin.vim'}

  use {'stevearc/aerial.nvim'}

  use {'L3MON4D3/LuaSnip'}
end)
