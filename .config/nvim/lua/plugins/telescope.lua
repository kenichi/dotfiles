return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  -- tag = "0.1.8",
  -- branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("telescope").setup{
      defaults = {
        mappings = {
          i = {
            ["<C-h>"] = "which_key"
          }
        }
      },
      pickers = {
      },
      extensions = {
        -- pasted from https://github.com/stevearc/aerial.nvim?tab=readme-ov-file#telescope
        aerial = {
          -- Set the width of the first two columns (the second
          -- is relevant only when show_columns is set to 'both')
          col1_width = 4,
          col2_width = 30,
          -- How to format the symbols
          format_symbol = function(symbol_path, filetype)
            if filetype == "json" or filetype == "yaml" then
              return table.concat(symbol_path, ".")
            else
              return symbol_path[#symbol_path]
            end
          end,
          -- Available modes: symbols, lines, both
          show_columns = "both",
        },
      }
    }

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    vim.keymap.set("n", "<leader>ft", builtin.treesitter, {})

    vim.keymap.set("n", "<leader>*", builtin.grep_string, {})
    vim.keymap.set("n", "<leader>&", builtin.lsp_references, {})
    vim.keymap.set("n", "<leader>fi", builtin.lsp_incoming_calls, {})
    vim.keymap.set("n", "<leader>fo", builtin.lsp_outgoing_calls, {})

    vim.keymap.set("n", "<leader>at", ":Telescope aerial<CR>")
  end,
}
