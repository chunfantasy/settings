return {
  {
    "numToStr/Comment.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    event = "VeryLazy",
    opts = function()
      return {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
    config = true,
    keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
    opts = {
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
    },
  },
}
