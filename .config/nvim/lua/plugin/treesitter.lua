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
  },
  opts = {
    highlight = { enable = true },
    incremental_selection = { enable = true },
    autotag = { enable = true },
    context_commentstring = { enable = true, enable_autocmd = false },
  },
})
