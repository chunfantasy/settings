-- Theme

-- nvim-tree
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 28,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    -- dotfiles = true,
  },
})

-- Color scheme catppuccin
require("catppuccin").setup({
  flavour = "latte", -- latte, frappe, macchiato, mocha
  transparent_background = true,
})
vim.cmd.colorscheme("catppuccin")

-- lualine
require("lualine").setup({
  options = { theme = "solarized_light" },
})

-- Vertical line for max length
-- require("virt-column").setup({})
