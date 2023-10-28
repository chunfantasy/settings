return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  event = { "VeryLazy" },
  opts = {
    autotag = {
      enable = true,
    },
  },
}
