return {
  "kdheepak/lazygit.nvim",
  -- optional for floating window border decoration
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim"
  },
  event = "VeryLazy",
  config = function()
    require("telescope").load_extension("lazygit")
  end,
}
