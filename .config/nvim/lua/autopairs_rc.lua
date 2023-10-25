local status, auto_pairs = pcall(require, "nvim-autopairs")
if not status then
  return
end

auto_pairs.setup({})
