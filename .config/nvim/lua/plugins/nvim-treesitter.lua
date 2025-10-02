return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",

  opts = {
    auto_install = true,
    sync_install = false,

    context_commentstring = {
      enable = true,
      enable_autocmd = false
    },

    ensure_installed = {
      "bash",
      "elixir",
      "erlang",
      "json",
      "lua",
      "markdown",
      "regex",
      "vim",
      "yaml",
    },

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
      use_languagetree = true,
    },
    incremental_selection = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  },

  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)

    vim.o.foldmethod = "expr"
    vim.o.foldexpr = "nvim_treesitter#foldexpr()"
    vim.o.foldenable = false
  end,
}
