return {
  "windwp/nvim-autopairs",
  dependencies = { "windwp/nvim-ts-autotag" },
  event = { "VeryLazy", "InsertEnter" },
  opts = {
    ignored_next_char = "[%w%.]",
  },
  config = true,
}
