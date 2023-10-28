return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    { "williamboman/mason.nvim", build = ":MasonUpdate" },
    "hrsh7th/cmp-nvim-lsp",
  },
  event = { "VeryLazy", "BufReadPre", "BufNewFile" },
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
  config = function(_, options)
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
    for server, _ in pairs(options.servers) do
      ensure_installed[#ensure_installed + 1] = server
    end

    local function setup(server)
      local server_opts = vim.tbl_deep_extend("force", {
        capabilities = vim.deepcopy(capabilities),
      }, options.servers[server] or {})

      lspconfig[server].setup(server_opts)
    end

    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    -- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    -- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    -- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local local_opts = { buffer = ev.buf }
        -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, local_opts)
        -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, local_opts)
        -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, local_opts)
        -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, local_opts)
        -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, local_opts)
        -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, local_opts)
        -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, local_opts)
        -- vim.keymap.set('n', '<space>wl', function()
        --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, local_opts)
        -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, local_opts)
        -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, local_opts)
        -- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, local_opts)
        -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, local_opts)
        vim.keymap.set('n', 'ff', function()
          vim.lsp.buf.format { async = true }
        end, local_opts)
        vim.api.nvim_create_autocmd("BufWritePre", {
          pattern = { "*.lua" },
          callback = function()
            vim.lsp.buf.format { async = true }
          end
        })
      end,
    })

    require("mason-lspconfig").setup({
      ensure_installed = ensure_installed,
      handlers = { setup },
    })
  end,
}
