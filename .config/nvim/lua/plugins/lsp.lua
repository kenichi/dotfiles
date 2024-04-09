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

      lspconfig.html.setup({
        filetypes = { "html", "heex" }
      })

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
        filetypes = { "html", "elixir", "eelixir", "heex", "vue" },
        root_dir = lspconfig.util.root_pattern(
          'tailwind.config.js',
          'tailwind.config.ts',
          'postcss.config.js',
          'postcss.config.ts',
          'package.json',
          'node_modules',
          '.git',
          'mix.exs'
        ),
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

      -- https://github.com/hashicorp/terraform-ls/blob/main/docs/USAGE.md#neovim-v080
      lspconfig.terraformls.setup{}
      vim.api.nvim_create_autocmd({"BufWritePre"}, {
        pattern = {"*.tf", "*.tfvars"},
        callback = function()
          vim.lsp.buf.format()
        end,
      })

      lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        filetypes = {
          "html",
          "css",
          -- "elixir",
          "eelixir",
          "heex"
        },
      })

      lspconfig.tsserver.setup({})
      -- lspconfig.denols.setup({})

      -- LEXIAL-LS (no find references yet)

      -- https://github.com/lexical-lsp/lexical/blob/main/pages/installation.md#neovim
      -- local configs = require("lspconfig.configs")

      -- local lexical_config = {
      --   filetypes = { "elixir", "eelixir", },
      --   cmd = { "/Users/kenichi/src/elixir/lexical/_build/dev/package/lexical/bin/start_lexical.sh" },
      --   settings = {},
      -- }

      -- if not configs.lexical then
      --   configs.lexical = {
      --     default_config = {
      --       filetypes = lexical_config.filetypes,
      --       cmd = lexical_config.cmd,
      --       root_dir = function(fname)
      --         return lspconfig.util.root_pattern("mix.exs", ".git")(fname) or vim.loop.os_homedir()
      --       end,
      --       -- optional settings
      --       settings = lexical_config.settings,
      --     },
      --   }
      -- end

      -- lspconfig.lexical.setup({})
    end
  },
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup({
        lightbulb = {
          enable = false
        },
      })
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
  },
  {
    "simrat39/rust-tools.nvim",
    config = function()
      local rt = require("rust-tools")

      rt.setup({
        server = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>r", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
      })
    end
  },
}
