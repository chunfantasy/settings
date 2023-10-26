-- print('Loading keymaps')

-- Fuzzy finder with telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- Toggle file explorer
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>", {
  noremap = true,
})

vim.keymap.set("n", "H", ":BufferLineCyclePrev<cr>", {
  noremap = true,
})
vim.keymap.set("n", "L", ":BufferLineCycleNext<cr>", {
  noremap = true,
})
