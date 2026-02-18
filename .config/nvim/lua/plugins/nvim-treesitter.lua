return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",

  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function()
        -- silently skip filetypes without a parser (e.g. blink-cmp-menu)
        if not pcall(vim.treesitter.start) then return end
        vim.wo[0][0].foldmethod = "expr"
        vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
      end,
    })
  end,
}
