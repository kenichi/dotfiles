-- live grep using Telescope inside the current directory under
-- the cursor (or the parent directory of the current file)
local function grep_in(node)
  if node then
    local path = node.absolute_path or uv.cwd()
    if node.type ~= 'directory' and node.parent then
      path = node.parent.absolute_path
    end
    require('telescope.builtin').live_grep({
      search_dirs = { path },
      prompt_title = string.format('Grep in [%s]', vim.fs.basename(path)),
    })
  end
end

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup()
    local api = require("nvim-tree.api")

    vim.keymap.set(
      "n",
      "<C-f>",
      function()
        local node = api.tree.get_node_under_cursor()
        grep_in(node)
      end,
      { desc = 'nvim-tree: Grep In', buffer = bufnr, noremap = true, silent = true, nowait = true }
    )
  end,
}
