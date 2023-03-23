require('nvim-treesitter.configs').setup({
  ensure_installed = "all",
  sync_install = false,
  ignore_install = { },
  highlight = {
    enable = true,
    disable = { },
    use_languagetree = true
  },
  indent = {
    enable = true
  }
})
