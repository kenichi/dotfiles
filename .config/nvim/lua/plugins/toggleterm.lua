return {
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({})

      function _G.set_terminal_keymaps()
        local opts = {buffer = 0}
        -- vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
        -- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
        -- vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        -- vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        -- vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        -- vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
        vim.keymap.set('t', '<C-y>', [[<C-\><C-n>:ToggleTerm<CR>]], opts)
      end

      -- if you only want these mappings for toggle term use term://*toggleterm#* instead
      vim.cmd([[
      autocmd! TermOpen term://* lua set_terminal_keymaps()
      map <C-y> :ToggleTerm size=40<CR>
      ]])
    end,
    tag = "2.4.0"
  },
}
