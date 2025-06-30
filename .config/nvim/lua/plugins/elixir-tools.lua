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
          enabled = true,
          tag = "v0.28.0",
          settings = elixirls.settings {
            dialyzerEnabled = true,
            enableTestLenses = false,
          },
          on_attach = function(client, bufnr)
            -- whatever keybinds you want, see below for more suggestions
            -- vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
            -- vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
            -- vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
            local map_opts = { buffer = true, noremap = true}
            vim.keymap.set("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", map_opts)
            vim.keymap.set("n", "<leader>cd", "<cmd>lua vim.diagnostic.open_float()<cr>", map_opts)
            vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", map_opts)

            vim.keymap.set("n", "gJ", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
            vim.keymap.set("n", "gS", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
          end,
          -- seems to make single .exs files work somewhat
          root_dir = function(fname)
            return require("lspconfig").util.root_pattern("mix.exs", ".git")(fname) or vim.loop.os_homedir()
          end,
        }
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  }
}
