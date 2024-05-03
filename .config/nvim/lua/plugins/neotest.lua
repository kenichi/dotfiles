return {
  {
    "nvim-neotest/neotest",
    tag = "v4.9.0",

    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-elixir")({
            extra_formatters = { "ExUnit.CLIFormatter", "ExUnitNotifier" },
          }),
        },
        quickfix = {
          open = false
        },
      })

      vim.keymap.set('n', '<leader>t', function()
        local neotest = require("neotest")
        neotest.run.run()
      end, {})

      vim.keymap.set('n', '<leader>T', function()
        local neotest = require("neotest")
        neotest.run.run(vim.fn.expand("%"))
      end, {})

      vim.keymap.set('n', '<leader>ta', function()
        local neotest = require("neotest")
        neotest.run.run({ suite = true })
        neotest.summary.open()
      end, {})

      vim.keymap.set('n', '<leader>ts', function()
        require("neotest").summary.toggle()
      end, {})

      vim.keymap.set('n', '<leader>to', function()
        require("neotest").output.open()
      end, {})

      vim.keymap.set('n', '<leader>tp', function()
        require("neotest").output_panel.toggle()
      end, {})
    end,

    dependencies = {
      "antoinemadec/FixCursorHold.nvim",
      "jfpedroza/neotest-elixir",
      -- "nvim-neotest/nvim-nio",
    }
  },
}
