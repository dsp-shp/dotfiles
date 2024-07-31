return {
    "williamboman/mason.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")
        mason.setup({
            ui = {
                icons = {
                    package_installed = "v",
                    package_pending = ">",
                    package_uninstalled = "x",
                },
            },
        })

    mason_lspconfig.setup({
        ensure_installed = {
            "pyright",
        },
        automatic_installation = true,
    })

    mason_tool_installer.setup({
        ensure_installed = {
            "prettier",
            "stylua",
            "isort",
            "black",
            "pylint",
            "pyright",
            "eslint_d",
        },
    })
    end,
}
