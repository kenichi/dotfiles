require('mason').setup()
require('mason-lspconfig').setup()
local lspconfig = require('plugin.lspconfig')
-- require('plugin.elixir').setup(lspconfig.on_attach)

require('kanagawa')

require('plugin.cmp')
require('plugin.treesitter')
require('plugin.telescope')
require('plugin.neotest')
require('gitsigns').setup()
require('lualine').setup()
require('plugin.toggleterm')
-- require('nvim-tree').setup()
-- require('nvim-ts-autotag').setup()
require('nvim-surround').setup()

vim.notify = require('notify')
