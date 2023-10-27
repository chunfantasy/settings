return {
    "neovim/nvim-lspconfig",
    opts = {
        servers = {
            eslint = {
                filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "markdown", "json" },
                settings = {
                    workingDirectory = { mode = "auto" },
                },
                on_attach = function(_, bufnr)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        command = "EslintFixAll",
                    })
                end,
            },
        },
    },
}
