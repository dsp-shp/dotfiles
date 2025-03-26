function lsp_keymap(bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end

-- local function which_python()
--   local f = io.popen('env which python', 'r') or error("Fail to execute 'env which python'")
--   local s = f:read('*a') or error("Fail to read from io.popen result")
--   f:close()
--   return string.gsub(s, '%s+$', '')
-- end

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
            py_path = venv_path .. "/bin/python3"
        else
            py_path = vim.g.python3_host_prog
        end

        lspconfig.pylsp.setup {
            -- on_attach = custom_attach,
            on_attach = function(client , bufnr)
                lsp_keymap(bufnr)
            end,
            settings = {
                pylsp = {
                plugins = {
                    -- formatter options
                    black = { enabled = true },
                    autopep8 = { enabled = false },
                    yapf = { enabled = false },
                    -- linter options
                    pylint = { enabled = true, executable = "pylint --verbose" },
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
                    -- jedi = {
                    --     environment = which_python()
                    -- },
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
