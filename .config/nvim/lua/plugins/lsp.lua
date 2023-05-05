local on_attach = function(client, bufnr)
  local opts = {
    noremap = true,
    silent = true
  }

  local set_keymap = function(key, cmd)
    vim.api.nvim_buf_set_keymap(bufnr, "n", key, cmd, opts)
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
end

return {
  {
    "williamboman/mason.nvim",

    config = function()
      require('mason').setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",

    config = function()
      require('mason-lspconfig').setup()
    end
  },
  {
    "neovim/nvim-lspconfig",

    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require('lspconfig')

      -- lspconfig.elixirls.setup({
      --   -- cmd = {"elixir-ls"},
      --   cmd = {"/Users/kenichi/src/elixir/elixir-ls/rel/language_server.sh"},
      --   on_attach = on_attach,
      --   capabilities = capabilities,
      --   settings = {
      --     dialyzerEnabled = true,
      --     fetchDeps = false,
      --     suggestSpecs = false,
      --   },
      -- })

      lspconfig.ruby_ls.setup({
        cmd = {"ruby-lsp"},
        on_attach = on_attach,
        capabilities = capabilities
      })

      -- lspconfig.solargraph.setup({
      --   cmd = {"solargraph"},
      --   on_attach = on_attach,
      --   capabilities = capabilities
      -- })

      -- below pasted from https://elixirforum.com/t/getting-heex-and-h-working-in-nvim-with-astronvim/54779/15

      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
        filetypes = { "html", "elixir", "eelixir", "heex" },
        init_options = {
          userLanguages = {
            elixir = "html-eex",
            eelixir = "html-eex",
            heex = "html-eex",
          },
        },
        settings = {
          tailwindCSS = {
            experimental = {
              classRegex = {
                'class[:]\\s*"([^"]*)"',
              },
            },
          },
        },
      })

      -- lspconfig.emmet_ls.setup({
      --   capabilities = capabilities,
      --   filetypes = { "html", "css", "elixir", "eelixir", "heex" },
      -- })

      lspconfig.tsserver.setup({})
      -- lspconfig.denols.setup({})

    end
  },
}
