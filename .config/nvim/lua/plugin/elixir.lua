local M = {}
local elixir = require('elixir')

M.setup = function(on_attach)

  elixir.setup({
    -- specify a repository and branch
    -- repo = "mhanberg/elixir-ls", -- defaults to elixir-lsp/elixir-ls
    -- branch = "mh/all-workspace-symbols", -- defaults to nil, just checkouts out the default branch, mutually exclusive with the `tag` option
    -- tag = "v0.13.0", -- defaults to nil, mutually exclusive with the `branch` option

    -- alternatively, point to an existing elixir-ls installation (optional)
    -- not currently supported by elixirls, but can be a table if you wish to pass other args `{"path/to/elixirls", "--foo"}`
    -- cmd = "/usr/local/bin/elixir-ls.sh",
    cmd = "elixir-ls",

    -- default settings, use the `settings` function to override settings
    settings = elixir.settings({
      dialyzerEnabled = true,
      fetchDeps = false,
      enableTestLenses = false,
      suggestSpecs = false,
    }),
  })

end

return M

--   on_attach = function(client, bufnr)
--     local map_opts = { buffer = true, noremap = true}

--     -- run the codelens under the cursor
--     vim.keymap.set("n", "<space>r",  vim.lsp.codelens.run, map_opts)
--     -- remove the pipe operator
--     vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", map_opts)
--     -- add the pipe operator
--     vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", map_opts)
--     vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", map_opts)

--     -- bindings for standard LSP functions.
--     vim.keymap.set("n", "<space>df", "<cmd>lua vim.lsp.buf.format()<cr>", map_opts)
--     vim.keymap.set("n", "<space>gd", "<cmd>lua vim.diagnostic.open_float()<cr>", map_opts)
--     vim.keymap.set("n", "<space>dt", "<cmd>lua vim.lsp.buf.definition()<cr>", map_opts)
--     vim.keymap.set("n", "<space>K", "<cmd>lua vim.lsp.buf.hover()<cr>", map_opts)
--     vim.keymap.set("n", "<space>gD","<cmd>lua vim.lsp.buf.implementation()<cr>", map_opts)
--     vim.keymap.set("n", "<space>1gD","<cmd>lua vim.lsp.buf.type_definition()<cr>", map_opts)
--     -- keybinds for fzf-lsp.nvim: https://github.com/gfanto/fzf-lsp.nvim
--     -- you could also use telescope.nvim: https://github.com/nvim-telescope/telescope.nvim
--     -- there are also core vim.lsp functions that put the same data in the loclist
--     vim.keymap.set("n", "<space>gr", ":References<cr>", map_opts)
--     vim.keymap.set("n", "<space>g0", ":DocumentSymbols<cr>", map_opts)
--     vim.keymap.set("n", "<space>gW", ":WorkspaceSymbols<cr>", map_opts)
--     vim.keymap.set("n", "<leader>d", ":Diagnostics<cr>", map_opts)


--     -- keybinds for vim-vsnip: https://github.com/hrsh7th/vim-vsnip
--     vim.cmd([[imap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']])
--     vim.cmd([[smap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']])

--     -- update capabilities for nvim-cmp: https://github.com/hrsh7th/nvim-cmp
--     -- require("cmp_nvim_lsp").update_capabilities(capabilities)
--   end
-- })
