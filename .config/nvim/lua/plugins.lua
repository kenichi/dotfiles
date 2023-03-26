-- see also plugins/*.lua

return {
  -- general
  "nvim-lua/plenary.nvim",

  -- tree/chrome
  "nvim-tree/nvim-web-devicons",
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup()
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup()
    end,
  },

  -- features
  "direnv/direnv.vim",
  "tpope/vim-commentary",
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  "AndrewRadev/splitjoin.vim",

  -- git
  "tpope/vim-fugitive",
  "sindrets/diffview.nvim",
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
    tag = "v0.6",
  },

  -- colorschemes
  "neanias/everforest-nvim",
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa")
    end
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
