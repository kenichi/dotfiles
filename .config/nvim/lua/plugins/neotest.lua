return {
  -- {
  --   "nvim-neotest/neotest",
  --   -- tag = "v4.9.0",

  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-neotest/nvim-nio",
  --     "antoinemadec/FixCursorHold.nvim",
  --     "nvim-treesitter/nvim-treesitter",

  --     "jfpedroza/neotest-elixir",
  --     "nvim-neotest/neotest-jest",
  --     "nvim-neotest/neotest-python",
  --   },

  --   config = function()
  --     neotest = require("neotest")

  --     neotest.setup({
  --       adapters = {
  --         require("neotest-elixir")({
  --           -- The Mix task to use to run the tests
  --           -- Can be a function to return a dynamic value.
  --           -- Default: "test"
  --           -- mix_task = {"my_custom_task"},
  --           -- Other formatters to pass to the test command as the formatters are overridden
  --           -- Can be a function to return a dynamic value.
  --           -- Default: {"ExUnit.CLIFormatter"}
  --           extra_formatters = {"ExUnit.CLIFormatter", "ExUnitNotifier"},
  --           -- Extra test block identifiers
  --           -- Can be a function to return a dynamic value.
  --           -- Block identifiers "test", "feature" and "property" are always supported by default.
  --           -- Default: {}
  --           -- extra_block_identifiers = {"test_with_mock"},
  --           -- Extra arguments to pass to mix test
  --           -- Can be a function that receives the position, to return a dynamic value
  --           -- Default: {}
  --           -- args = {"--trace"},
  --           -- Command wrapper
  --           -- Must be a function that receives the mix command as a table, to return a dynamic value
  --           -- Default: function(cmd) return cmd end
  --           -- post_process_command = function(cmd)
  --           --   return vim.iter({{"env", "FOO=bar"}, cmd}):flatten():totable()
  --           -- end,
  --           -- Delays writes so that results are updated at most every given milliseconds
  --           -- Decreasing this number improves snappiness at the cost of performance
  --           -- Can be a function to return a dynamic value.
  --           -- Default: 1000
  --           -- write_delay = 10,
  --           -- The pattern to match test files
  --           -- Default: "_test.exs$"
  --           -- test_file_pattern = ".test.exs$",
  --           -- Function to determine whether a directory should be ignored
  --           -- By default includes root test directory and umbrella apps' test directories
  --           -- Params:
  --           -- - name (string) - Name of directory
  --           -- - rel_path (string) - Path to directory, relative to root
  --           -- - root (string) - Root directory of project
  --           -- filter_dir = function(name, rel_path, root)
  --           --   return rel_path == "test"
  --           --       or rel_path == "lib"
  --           --       or vim.startswith(rel_path, 'test/')
  --           --       or vim.startswith(rel_path, 'lib/')
  --           -- end,
  --         }),
  --         require("neotest-python"),
  --         require("neotest-jest")({
  --           -- jestCommand = "npm test --",
  --           -- jestConfigFile = "custom.jest.config.ts",
  --           -- env = { CI = true },
  --           cwd = function(path)
  --             return vim.fn.getcwd()
  --           end,
  --         }),
  --       },
  --       quickfix = {
  --         open = false
  --       },
  --     })

  --     vim.keymap.set('n', '<leader>t', function()
  --       neotest.run.run()
  --     end, {})

  --     vim.keymap.set('n', '<leader>T', function()
  --       neotest.run.run(vim.fn.expand("%"))
  --     end, {})

  --     vim.keymap.set('n', '<leader>ta', function()
  --       neotest.run.run({ suite = true })
  --       neotest.summary.open()
  --     end, {})

  --     vim.keymap.set('n', '<leader>ts', function()
  --       neotest.summary.toggle()
  --     end, {})

  --     vim.keymap.set('n', '<leader>to', function()
  --       neotest.output.open()
  --     end, {})

  --     vim.keymap.set('n', '<leader>tp', function()
  --       neotest.output_panel.toggle()
  --     end, {})

  --     vim.keymap.set('n', '<leader>tq', function()
  --       neotest.summary.close()
  --     end, {})
  --   end,
  -- },
}
