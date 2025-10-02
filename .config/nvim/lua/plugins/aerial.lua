return {
  'stevearc/aerial.nvim',
  opts = {},
  config = function()
    require("aerial").setup({})

    vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
}
