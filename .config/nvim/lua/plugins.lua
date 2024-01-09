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
  "elixir-editors/vim-elixir",
  "tpope/vim-dadbod",

  -- git
  "tpope/vim-fugitive",
  "sindrets/diffview.nvim",
  {
    "lewis6991/gitsigns.nvim",
    config = true,
    tag = "v0.6",
  },
  {
    "pwntester/octo.nvim",
    config = true,
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
  "pappasam/papercolor-theme-slim",
  "ray-x/aurora",
  "shaunsingh/nord.nvim",
  {
    "catppuccin/nvim",
    name = "catppuccin"
  },
  "sainnhe/edge",
  {
    'projekt0n/github-nvim-theme',
    version = 'v0.0.7'
  },
  "jacoborus/tender.vim",
  "savq/melange-nvim",
}
