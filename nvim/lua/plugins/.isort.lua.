return {
    "brentyi/isort.vim",
    event = "VimEnter",
    config=function()
        vim.api.nvim_create_autocmd("BufWritePre", { 
            command="call isort#Isort(0, line('$'), v:null, v:false)",
        })
    end,
}
