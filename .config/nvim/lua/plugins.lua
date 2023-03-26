-- see also plugins/*.lua

return {
  -- general
  "nvim-lua/plenary.nvim",

  -- tree/chrome
  "nvim-tree/nvim-web-devicons",
  {
    "nvim-lualine/lualine.nvim",
    config = true,
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = true,
  },

  -- features
  "direnv/direnv.vim",
  "tpope/vim-commentary",
  {
    "kylechui/nvim-surround",
    config = true,
  },
  "AndrewRadev/splitjoin.vim",
  {
    "windwp/nvim-ts-autotag",
    config = true,
  },

  -- git
  "tpope/vim-fugitive",
  "sindrets/diffview.nvim",
  {
    "lewis6991/gitsigns.nvim",
    config = true,
    tag = "v0.6",
  },

  -- colorschemes
  "neanias/everforest-nvim",
  {
    "rebelot/kanagawa.nvim",
    config = true
  },
  "marko-cerovac/material.nvim",
  "folke/tokyonight.nvim",
  {
    "metalelf0/jellybeans-nvim",
    dependencies = {
      "rktjmp/lush.nvim",
    }
  },
}