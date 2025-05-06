return {
  "nvim-lualine/lualine.nvim",
  config = function()
    -- Load the custom CodeCompanion component
    local CodeCompanionStatus = require("utils.codecompanion_lualine")()

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
      sections = {
        lualine_x = {
          { CodeCompanionStatus },
          "encoding",
          "fileformat",
          "filetype",
        },
      },
    })
  end
}
