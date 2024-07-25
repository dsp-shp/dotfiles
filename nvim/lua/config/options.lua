vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

vim.g.neovide_margin_left = 5
vim.g.neovide_padding_right = 5

opt.encoding = "utf-8"
opt.mouse = a
-- opt.noswapfile
opt.relativenumber = true
opt.autoindent = true
opt.fileformat = unix
opt.clipboard:append("unnamed,unnamedplus")

opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true
opt.shiftwidth = 4
opt.colorcolumn = "80"

-- opt.wrap = false
opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "auto"

opt.backspace = "indent,eol,start"
