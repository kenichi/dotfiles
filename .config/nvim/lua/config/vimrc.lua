vim.opt.autoindent = true
vim.opt.backup = false
vim.opt.bg = "dark"
vim.opt.clipboard:append { "unnamedplus" }
vim.opt.cursorline = true
vim.opt.diffopt = "vertical"
vim.opt.expandtab = true
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.updatetime = 250
vim.opt.wildignore = {
  ".git",
  ".*.swp",
  "node_modules",
  "backup",
}

-- colorscheme
vim.cmd.colorscheme("jellybeans-nvim")
vim.cmd.hi("Normal", "guibg=none", "ctermbg=none")
vim.cmd.hi("NonText", "guibg=none", "ctermbg=none")

local function toggle_color()
  if vim.o.background == "dark" then
    vim.o.background = "light"
    vim.cmd("colorscheme catppuccin-latte")
  else
    vim.o.background = "dark"
    vim.cmd("colorscheme jellybeans-nvim")
    vim.cmd("hi Normal guibg=none ctermbg=none")
    vim.cmd("hi NonText guibg=none ctermbg=none")
  end
end

vim.keymap.set("n", "<C-o>", toggle_color)

-- lazy/mason
vim.keymap.set("n", "<Leader>lz", "<cmd>Lazy<CR>")
vim.keymap.set("n", "<Leader>ma", "<cmd>Mason<CR>")

-- unhighlight
vim.keymap.set({"n","v","o"}, "<M-d>", ":noh<CR>")

-- navigate wraps
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("v", "j", "gj")
vim.keymap.set("v", "k", "gk")

-- navigate buffers
vim.keymap.set({"n","v","o"}, "<M-j>", ":bn<CR>")
vim.keymap.set({"n","v","o"}, "<M-k>", ":bp<CR>")
vim.keymap.set("n", "<M-n>", ":enew<CR>")

-- close buffer, keep window
vim.keymap.set("n", "<C-w><C-k>", function()
  local bufnr = vim.api.nvim_get_current_buf()
  local win_ids = vim.fn.win_findbuf(bufnr)
  local bnext_or_enew = function()
    vim.cmd("bnext")

    if vim.api.nvim_get_current_buf() == bufnr then
      vim.cmd("enew")
    end
  end

  for _, win in ipairs(win_ids) do
    vim.api.nvim_win_call(win, bnext_or_enew)
  end

  vim.api.nvim_buf_delete(bufnr, { force = true })
end)

-- navigate windows
vim.keymap.set({"n","v","o"}, "<C-h>", "<C-w>h")
vim.keymap.set({"n","v","o"}, "<C-l>", "<C-w>l")
vim.keymap.set({"n","v","o"}, "<C-j>", "<C-w>j")
vim.keymap.set({"n","v","o"}, "<C-k>", "<C-w>k")

-- nvim-tree
vim.keymap.set({"n","v","o"}, "<C-n>", ":NvimTreeFindFileToggle<CR>")

-- replace visual selection
vim.keymap.set("v", "<C-r>", '"hy:%s/<C-r>h//gc<left><left><left>')

-- tmux clipboard
vim.g.clipboard = {
  cache_enabled = 1,
  copy = {
    ["+"] = { "tmux", "load-buffer", "-w", "-" },
    ["*"] = {"tmux", "load-buffer", "-w", "-"},
  },
  name = "tmux_clipboard",
  paste = {
    ["+"] = {"tmux", "save-buffer", "-"},
    ["*"] = {"tmux", "save-buffer", "-"},
  },
}

-- diagnostic float on cursor hold
vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
  end,
})

-- terraform
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*.tf", "*.tfvars"},
  command = "set filetype=terraform",
})

vim.g.terraform_fmt_on_save = 1
vim.g.terraform_align = 1

-- auto-comment only when wrapping or <CR>
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove("o")
  end,
})

-- trim whitespace
vim.keymap.set("n", "<F9>", function ()
  vim.cmd([[:%s/^\s\+$//]])
  vim.cmd([[:%s/\s\+$//]])
end)

-- copy filename.ext:line_number
local function copy_filename_and_line()
  vim.cmd("!echo -n %:" .. vim.fn.line(".") .. " | tmux load-buffer -")
end

vim.keymap.set("n", "<leader>ct", copy_filename_and_line)

-- show diags immediately
vim.keymap.set("n", "<leader>cd",
  "<cmd>lua vim.diagnostic.open_float()<cr>") --,
  -- { buffer = true, noremap = true })

-- format buffer with lsp (without writing)
vim.keymap.set("n", "<Leader>cf",
  "<cmd>lua vim.lsp.buf.format({async = true})<CR>") --,
  -- { buffer = true, noremap = true })

-- format buffer with lsp on save
vim.api.nvim_create_autocmd("BufWritePre", {
  buffer = buffer,
  callback = function()
    vim.lsp.buf.format { async = false }
  end
})

-- tiny-code-action
vim.keymap.set({ "n", "x" }, "<leader>ca", function()
  require("tiny-code-action").code_action()
end, { noremap = true, silent = true })

-- default fold level
vim.opt.foldlevel = 1
