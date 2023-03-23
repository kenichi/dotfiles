require("neotest").setup({
  adapters = {
    require("neotest-elixir")
  }
})

vim.keymap.set('n', '<leader>t', function()
  local neotest = require("neotest")
  neotest.run.run()
end, {})

vim.keymap.set('n', '<leader>T', function()
  local neotest = require("neotest")
  neotest.run.run(vim.fn.expand("%"))
end, {})

vim.keymap.set('n', '<leader>ts', function()
  require("neotest").summary.open()
end, {})

vim.keymap.set('n', '<leader>tc', function()
  require("neotest").summary.close()
end, {})

vim.keymap.set('n', '<leader>to', function()
  require("neotest").output.open()
end, {})
