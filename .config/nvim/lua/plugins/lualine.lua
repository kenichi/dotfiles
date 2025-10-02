return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      extensions = {
        "lazy",
        "mason",
        "nvim-tree",
        "quickfix",
        "toggleterm",
      },
    })
  end
}
