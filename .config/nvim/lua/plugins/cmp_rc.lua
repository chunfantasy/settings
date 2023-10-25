return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "dmitmel/cmp-cmdline-history",
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-nvim-lua",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },
    event = { "VeryLazy", "InsertEnter", "CmdlineEnter" },
    config = function()
        local cmp = require("cmp")
        local lspkind = require("lspkind")

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },

            view = {
                entries = {name = "custom", selection_order = "near_cursor" }
            },

            preselect = cmp.PreselectMode.None,

            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "nvim_lua" },
            }),

            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
                ["<C-e>"] = {
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close(),
                },
            }),

            window = {
                documentation = {
                    winhighlight = "Normal:Normal,FloatBorder:Pmenu,Search:None",
                    border = "rounded",
                    max_height = 15,
                    max_width = 60,
                },
                completion = {
                    border = "rounded",
                    scrollbar = false,
                },
            },

            formatting = {
                fields = { "kind", "abbr" },
                format = lspkind.cmp_format({ mode = "symbol" }),
            }
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            })
        })

        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
                { name = "cmdline-history" },
            },
        })

        cmp.event:on("menu_opened", function()
            local buf = vim.api.nvim_get_current_buf()
            local floatId = vim.F.npcall(vim.api.nvim_buf_get_var, buf, "lsp_floating_preview")
            if floatId and vim.api.nvim_win_is_valid(floatId) then
                vim.api.nvim_win_close(floatId, true)
            end
        end)

    end,
}
