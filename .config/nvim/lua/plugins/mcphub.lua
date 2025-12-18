return {
  "ravitemer/mcphub.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  build = "pnpm install -g mcp-hub@latest",  -- Installs `mcp-hub` node binary globally
  config = function()
    require("mcphub").setup()
  end
}
