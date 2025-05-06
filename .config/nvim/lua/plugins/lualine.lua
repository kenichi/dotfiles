return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      extensions = {
        "aerial",
        "fugitive",
        "lazy",
        "mason",
        "nvim-tree",
        "quickfix",
        "toggleterm",
        "trouble",
      },
    })
  end
}
