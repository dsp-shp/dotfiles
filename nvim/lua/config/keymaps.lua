vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>")
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>")
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>")
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>")
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>")
keymap.set("i", "№", "#")
