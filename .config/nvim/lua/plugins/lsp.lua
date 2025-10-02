return {
  {
    "williamboman/mason.nvim",

    -- config = function()
    --   require('mason').setup()
    -- end
    opts = {}
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
      -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
      -- local util = require('lspconfig.util')

      vim.lsp.config('html', {
        -- filetypes = { "html", "heex" }
        filetypes = { "html" }
      })
      vim.lsp.enable('html')

      -- https://elixirforum.com/t/getting-heex-and-h-working-in-nvim-with-astronvim/54779/15
      -- updated for 0.11.x vim.lsp.config
      vim.lsp.config('tailwindcss', {
        -- capabilities = capabilities,
        filetypes = { "html", "elixir", "eelixir", "heex", "vue" },
        -- root_dir = util.root_pattern(
        --   'tailwind.config.js',
        --   'tailwind.config.ts',
        --   'postcss.config.js',
        --   'postcss.config.ts',
        --   'package.json',
        --   'node_modules',
        --   '.git',
        --   'mix.exs'
        -- ),
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
      vim.lsp.enable('tailwindcss')

      -- https://github.com/hashicorp/terraform-ls/blob/main/docs/USAGE.md#neovim-v080
      vim.lsp.config('terraformls', {})
      vim.api.nvim_create_autocmd({"BufWritePre"}, {
        pattern = {"*.tf", "*.tfvars"},
        callback = function()
          vim.lsp.buf.format()
        end,
      })
      vim.lsp.enable('terraformls')

      vim.lsp.config('emmet_ls', {
        capabilities = capabilities,
        filetypes = {
          "html",
          "css",
          -- "elixir",
          -- "eelixir",
          -- "heex"
        },
      })
      vim.lsp.enable('emmet_ls')

      vim.lsp.enable('ts_ls')

      -- https://jdhao.github.io/2023/07/22/neovim-pylsp-setup/
      vim.lsp.config('pylsp', {
        settings = {
          pylsp = {
            plugins = {
              -- formatter options
              -- black = { enabled = true },
              -- autopep8 = { enabled = false },
              yapf = { enabled = true },
              -- linter options
              pylint = { enabled = true, executable = "pylint" },
              -- pyflakes = { enabled = false },
              pycodestyle = { enabled = false },
              -- type checker
              pylsp_mypy = { enabled = true },
              -- auto-completion options
              jedi_completion = { fuzzy = true },
              -- import sorting
              pyls_isort = { enabled = true },
            },
          },
        },
      })
      vim.lsp.enable('pylsp')

      -- npm i -g graphql-language-service-cli
      vim.lsp.config('graphql', {
    		-- root_dir = util.root_pattern(".graphqlrc.json"),
    		flags = {
    			debounce_text_changes = 150,
    		},
    		-- capabilities = capabilities,
      })
      vim.lsp.enable('graphql')
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
  -- {
  --   "simrat39/rust-tools.nvim",
  --   config = function()
  --     local rt = require("rust-tools")

  --     rt.setup({
  --       server = {
  --         on_attach = function(_, bufnr)
  --           -- Hover actions
  --           vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
  --           -- Code action groups
  --           vim.keymap.set("n", "<Leader>r", rt.code_action_group.code_action_group, { buffer = bufnr })
  --         end,
  --       },
  --     })
  --   end
  -- },
}
