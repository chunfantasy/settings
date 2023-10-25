-- print('Loading keymaps')
-- Change default leader key '\' to <space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- Toggle file explorer
vim.keymap.set("n", "<leader>e", ":NvimTreeOpen<cr>", {
  noremap = true,
})

-- Clear search
vim.keymap.set("n", "<leader><space>", ":let @/=''<cr>")
