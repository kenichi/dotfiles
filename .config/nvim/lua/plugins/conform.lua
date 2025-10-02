return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        -- lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        -- python = { "isort", "black" },
        -- You can customize some of the format options for the filetype (:help conform.format)
        -- rust = { "rustfmt", lsp_format = "fallback" },
        -- Conform will run the first available formatter
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
        javascript = { "prettier", stop_after_first = true },
      },
    })

    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,

  -- event = { "BufWritePre" },
  -- cmd = { "ConformInfo" },
  -- keys = {
  --   {
  --     -- Customize or remove this keymap to your liking
  --     "<leader>cf",
  --     function()
  --       require("conform").format({ async = true, lsp_fallback = true })
  --     end,
  --     mode = "",
  --     desc = "Format buffer",
  --   },
  -- },
  -- -- Everything in opts will be passed to setup()
  -- opts = {
  --   -- Define your formatters
  --   formatters_by_ft = {
  --     -- lua = { "stylua" },
  --     -- python = { "isort", "black" },
  --     html = { "prettier" },
  --     javascript = { "prettier" },
  --     json = { "prettier" },
  --     typescript = { "prettier" },
  --     typescriptreact = { "prettier" },
  --   },
  --   -- Set up format-on-save
  --   format_on_save = { timeout_ms = 500, lsp_fallback = true },
  --   -- Customize formatters
  --   -- formatters = {
  --   --   shfmt = {
  --   --     prepend_args = { "-i", "2" },
  --   --   },
  --   -- },
  -- },
  -- init = function()
  --   -- If you want the formatexpr, here is the place to set it
  --   vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  -- end,
}
