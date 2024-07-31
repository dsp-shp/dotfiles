return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { 
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v3.x',
            lazy = true,
            config = false,
            init = function()
              -- Disable automatic setup, we are doing it manually
              vim.g.lsp_zero_extend_cmp = 0
              vim.g.lsp_zero_extend_lspconfig = 0
            end,
        },
    },
    config = function()
        local lsp_zero = require("lsp-zero")
        lsp_zero.extend_lspconfig()

        lsp_zero.on_attach(
            function(client, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
                lsp_zero.default_keymaps({buffer = bufnr})
            end
        )

        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {},
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,
            }
        })

        require('lspconfig').pyright.setup{}

        local servers = { "pyright" }
    end,
}
