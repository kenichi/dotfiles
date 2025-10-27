function toggle_git_status()
  local fugitive_bufname = vim.fn.bufname('fugitive:///*/.git//')
  if vim.fn.buflisted(fugitive_bufname) == 1 then
    vim.cmd("bdelete " .. fugitive_bufname)
  else
    vim.cmd("Git")
  end
end

return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<F6>", toggle_git_status)
    vim.keymap.set("n", "<F7>", "<cmd>Gdiffsplit!<CR>")
    vim.keymap.set("n", "<F8>", "<cmd>Git commit<CR>")
  end,
}
