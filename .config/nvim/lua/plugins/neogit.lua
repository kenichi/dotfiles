return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require('neogit').setup({
      kind = "split",
      commit_editor = {
        kind = "split",
      },
      popup = {
        kind = "split",
      },
    })

    require('diffview').setup({
      enhanced_diff_hl = true,
    })

    vim.keymap.set("n", "<F6>", function()
      local neogit = require("neogit")

      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype == "NeogitStatus" then
          vim.cmd("close")
          return
        end
      end

      neogit.open({ kind = "split" })
    end, { desc = "Toggle Neogit status" })

    vim.keymap.set("n", "<F7>", function()
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype == "DiffviewFiles" then
          vim.cmd("DiffviewClose")
          return
        end
      end

      vim.cmd("DiffviewOpen")
    end, { desc = "Open diffview" })

    vim.keymap.set("n", "<F8>", function()
      require("neogit").open({ "commit" })
    end, { desc = "Git commit" })

    vim.keymap.set({"n","v","o"}, "<Leader>do", ":DiffviewOpen<CR>")
    vim.keymap.set({"n","v","o"}, "<Leader>dc", ":DiffviewClose<CR>")
  end,
}
