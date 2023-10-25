local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  sources = {
    -- General
    null_ls.builtins.completion.spell,

    -- Lua
    null_ls.builtins.formatting.stylua,

    -- JavaScript
    null_ls.builtins.diagnostics.eslint,

    -- Kotlin
    null_ls.builtins.formatting.ktlint,
    null_ls.builtins.diagnostics.ktlint,
  },

  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
          -- Format on save
          vim.lsp.buf.format({ async = false })
        end,
      })
    end
  end,
})
