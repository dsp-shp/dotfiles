return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp",
        },
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
        "onsails/lspkind.nvim",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            completion = {
                completeopt = "menu,menuone,preview,noselect",
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = {
                ['<C-k>'] = cmp.mapping.select_prev_item(),
                ['<C-j>'] = cmp.mapping.select_next_item(),
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.close(),
                ['<CR>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true
                },
                ['<Tab>'] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                      cmp.select_next_item()
                  elseif luasnip.expand_or_locally_jumpable() then
                      luasnip.expand_or_jump()
                  else
                    fallback()
                  end
                end, {'i', 's'}),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                      cmp.select_prev_item()
                  elseif luasnip.expand_or_locally_jumpable(-1) then
                      luasnip.jump(-1)
                  else
                    fallback()
                  end
                end, {'i', 's'}),
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            }),
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            -- formatting = {
            --     format = lspkind.cmp_format({
            --         maxwidth = 50,
            --         ellipsis_char = "...",
            --     }),
            -- },
        })
    end,
}
