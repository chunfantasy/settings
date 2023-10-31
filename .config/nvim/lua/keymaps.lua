-- print('Loading keymaps')

-- Fuzzy finder with telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff",
  ":lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
  {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- Toggle file explorer
vim.keymap.set("n", "<leader>ee", ":NvimTreeOpen<cr>", {
  noremap = true,
})
vim.keymap.set("n", "<leader>ex", ":NvimTreeClose<cr>", {
  noremap = true,
})

-- Bufferline
vim.keymap.set("n", "H", ":BufferLineCyclePrev<cr>", {
  noremap = true,
})
vim.keymap.set("n", "L", ":BufferLineCycleNext<cr>", {
  noremap = true,
})

-- Lazygit
vim.keymap.set("n", "<leader>gg", ":LazyGit<cr>", {
  noremap = true,
})

-- Symbols outline
vim.keymap.set("n", "<leader>so", ":SymbolsOutline<cr>", {
  noremap = true,
})

-- Trouble
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
