-- Display
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.scrolloff = 2 -- cursor middle
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("tab: >")
-- vim.opt.listchars:append("eol:↴")
vim.opt.colorcolumn = "80,100,120"
vim.opt.eol = true
vim.opt.eof = true

require("indent_blankline").setup({
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
  show_end_of_line = true,
})

-- Editing
vim.opt.backspace = "indent,eol,start" -- Backspacing is allowed over everything in insert mode
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
-- vim.opt.clipboard = "unnamedplus" -- Use system clipboard by default

-- Searching
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true

-- Encoding
vim.opt.encoding = "utf-8"
