local grey239 = "#4e4e4e"
local grey236 = "#303030"
local grey234 = "#1c1c1c"

return {
  {
    "bluz71/vim-moonfly-colors",
    config = function()
      local custom_highlight = vim.api.nvim_create_augroup("CustomHighlight", {})
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "moonfly",
        callback = function()
          -- highlight(0, "Folded", { bg = grey234, fg = grey239 })
          -- highlight(0, "FoldColumn", { bg = grey236, fg = grey239 })
          vim.api.nvim_set_hl(0, "Folded", { bg = grey234, fg = grey239 })
          vim.api.nvim_set_hl(0, "FoldColumn", { bg = grey236, fg = grey239 })
        end,
        group = custom_highlight,
      })
    end,
  }
}
