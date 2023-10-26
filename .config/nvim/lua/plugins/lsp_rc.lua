return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        { "williamboman/mason.nvim", build = ":MasonUpdate" },
        "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
        servers = {
            tsserver = {},
            cssmodules_ls = {},
            cssls = {},
            lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim", "require" },
                        },
                        -- Do not send telemetry data containing a randomized but unique identifier
                        telemetry = {
                          enable = false,
                        },
                    },
                },
            },
            html = {},
            yamlls = {},
            tailwindcss = {},
        },
    },
    event = { "VeryLazy", "BufReadPre", "BufNewFile" },
    config = function(_, opts)
        require("mason").setup({
            ui = {
                border = "rounded",
            },
        })

        local lspconfig = require("lspconfig")
        local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
          "force",
          vim.lsp.protocol.make_client_capabilities(),
          has_cmp and cmp_nvim_lsp.default_capabilities() or {}
        )

        local ensure_installed = {}
        for server, _ in pairs(opts.servers) do
            ensure_installed[#ensure_installed + 1] = server
        end

        local function setup(server)
            local server_opts = vim.tbl_deep_extend("force", {
                capabilities = vim.deepcopy(capabilities),
            }, opts.servers[server] or {})

            lspconfig[server].setup(server_opts)
        end

        require("mason-lspconfig").setup({
            ensure_installed = ensure_installed,
            handlers = { setup },
        })
    end,
}
