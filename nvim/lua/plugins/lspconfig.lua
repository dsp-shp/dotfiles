return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        -- require("mason").setup({})
        local lspconfig = require("lspconfig")
        local keymap = vim.keymap

        -- PyLSP setup, see: https://jdhao.github.io/2023/07/22/neovim-pylsp-setup
        local venv_path = os.getenv('VIRTUAL_ENV')
        local py_path = nil
        -- decide which python executable to use for mypy
        if venv_path ~= nil then
            py_path = venv_path .. "/usr/lib/python3.10"
        else
            py_path = vim.g.python3_host_prog
        end

        lspconfig.pylsp.setup {
            on_attach = custom_attach,
            settings = {
                pylsp = {
                plugins = {
                    -- formatter options
                    black = { enabled = true },
                    autopep8 = { enabled = false },
                    yapf = { enabled = false },
                    -- linter options
                    pylint = { enabled = true, executable = "pylint" },
                    pyflakes = { enabled = false },
                    pycodestyle = { enabled = false },
                    -- type checker
                    pylsp_mypy = {
                        enabled = true,
                        overrides = { "--python-executable", py_path, true },
                        report_progress = true,
                        live_mode = false
                    },
                    -- auto-completion options
                    jedi_completion = { fuzzy = true },
                    -- import sorting
                    pyls_isort = { enabled = true },
                },
            },
        },
        flags = {
            debounce_text_changes = 200,
        },
        capabilities = capabilities,
        }

    end,
}
