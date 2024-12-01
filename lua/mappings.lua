require "nvchad.mappings"

local map = vim.keymap.set

map({ "n", "v" }, "<C-d>", "<C-d>zz")
map({ "n", "v" }, "<C-u>", "<C-u>zz")
map({ "n", "v" }, "n", "nzzzv")
map({ "n", "v" }, "N", "Nzzzv")
map({ "n", "v" }, "G", "Gzz")
map("n", "<leader>", "")

map("v", "J", ":m '>+1<cr>gv=gv")
map("v", "K", ":m '<-2<cr>gv=gv")
map("v", "<", "<gv", { desc = "Indent line" })
map("v", ">", ">gv", { desc = "Indent line" })

map("n", "<leader>gs", ":Neogit<CR>")
map("n", "<leader>gc", ":Neogit commit<CR>")

map("n", "<leader>dm", "<cmd>NoiceDismiss<CR>")

-- Undo tree
map('n', '<leader>ut', vim.cmd.UndotreeToggle)

local nomap = vim.keymap.del

nomap("i", "<C-b>")
nomap("i", "<C-e>")
nomap("i", "<C-h>")
nomap("i", "<C-l>")
nomap("i", "<C-j>")
nomap("i", "<C-k>")
