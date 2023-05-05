local on_attach = function(client, bufnr)
  local opts = {
    noremap = true,
    silent = true
  }

  local set_keymap = function(key, cmd)
    vim.keymap.set(key, cmd, opts)
  end

  set_keymap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  -- set_keymap("<leader>&", "<cmd>lua vim.lsp.buf.references()<CR>")
  set_keymap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
  set_keymap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  set_keymap("K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  -- set_keymap("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  -- set_keymap("<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>")
  -- set_keymap("<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  set_keymap("<leader>cf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")
  set_keymap("<leader>cd", "<cmd>lua vim.diagnostic.open_float()<CR>")
  set_keymap("[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
  set_keymap("]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")

  vim.keymap.set("n", "gJ", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
  vim.keymap.set("n", "gS", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
  vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
end

local m_on_attach = function(client, bufnr)
  local map_opts = { buffer = true, noremap = true}

  -- run the codelens under the cursor
  vim.keymap.set("n", "<space>r",  vim.lsp.codelens.run, map_opts)
  -- remove the pipe operator
  -- vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", map_opts)
  vim.keymap.set("n", "gJ", ":ElixirFromPipe<cr>", map_opts)
  -- add the pipe operator
  -- vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", map_opts)
  vim.keymap.set("n", "gS", ":ElixirToPipe<cr>", map_opts)
  vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", map_opts)

  -- bindings for standard LSP functions.
  -- vim.keymap.set("n", "<space>df", "<cmd>lua vim.lsp.buf.format()<cr>", map_opts)
  vim.keymap.set("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", map_opts)
  -- vim.keymap.set("n", "<space>gd", "<cmd>lua vim.diagnostic.open_float()<cr>", map_opts)
  vim.keymap.set("n", "<leader>cd", "<cmd>lua vim.diagnostic.open_float()<cr>", map_opts)
  -- vim.keymap.set("n", "<space>dt", "<cmd>lua vim.lsp.buf.definition()<cr>", map_opts)
  vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.definition()<cr>", map_opts)
  -- vim.keymap.set("n", "<space>K", "<cmd>lua vim.lsp.buf.hover()<cr>", map_opts)
  vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", map_opts)
  vim.keymap.set("n", "<space>gD","<cmd>lua vim.lsp.buf.implementation()<cr>", map_opts)
  vim.keymap.set("n", "<space>1gD","<cmd>lua vim.lsp.buf.type_definition()<cr>", map_opts)
  -- keybinds for fzf-lsp.nvim: https://github.com/gfanto/fzf-lsp.nvim
  -- you could also use telescope.nvim: https://github.com/nvim-telescope/telescope.nvim
  -- there are also core vim.lsp functions that put the same data in the loclist
  vim.keymap.set("n", "<space>gr", ":References<cr>", map_opts)
  vim.keymap.set("n", "<space>g0", ":DocumentSymbols<cr>", map_opts)
  vim.keymap.set("n", "<space>gW", ":WorkspaceSymbols<cr>", map_opts)
  vim.keymap.set("n", "<leader>d", ":Diagnostics<cr>", map_opts)
end

return {
  {
    "elixir-tools/elixir-tools.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local elixir = require("elixir")
      local elixirls = require("elixir.elixirls")

      elixir.setup {
        credo = {},
        elixirls = {
          tag = "v0.14.3",
          enabled = true,
          settings = elixirls.settings {
            dialyzerEnabled = true,
            enableTestLenses = false,
          },
          on_attach = m_on_attach,
          -- on_attach = function(client, bufnr)
          --   whatever keybinds you want, see below for more suggestions
          --   vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
          --   vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
          --   vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
          -- end,
        }
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  }
}
