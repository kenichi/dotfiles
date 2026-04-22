return {
  "emrearmagan/dockyard.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "akinsho/toggleterm.nvim", -- optional
  },
  cmd = { "Dockyard", "DockyardFloat" },
  lazy = true,
  config = function()
    require("dockyard").setup({})
  end,
}
