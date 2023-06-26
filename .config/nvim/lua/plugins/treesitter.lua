return {
  {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.0",

    opts = {
      auto_install = true,
      sync_install = false,

      context_commentstring = {
        enable = true,
        enable_autocmd = false
      },

      -- ensure_installed = "all",
      ensure_installed = {
        "bash",
        "elixir",
        "erlang",
        "help",
        "json",
        "lua",
        "markdown",
        "regex",
        "ruby",
        "vim",
        "yaml",
      },

      autotag = {
        enable = true
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
    end
  }
}
