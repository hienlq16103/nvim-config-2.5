require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
--map("i", "jk", "<ESC>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map({"n", "v"}, "<C-d>", "<C-d>zz")
map({"n", "v"}, "<C-u>", "<C-u>zz")
map({"n", "v"}, "n", "nzzzv")
map({"n", "v"}, "N", "Nzzzv")
map({"n", "v"}, "G", "Gzz")
map("n", "<leader>", "")

map("v", "J", ":m '>+1<cr>gv=gv")
map("v", "K", ":m '<-2<cr>gv=gv")
map("v", "<", "<gv", { desc = "Indent line" })
map("v", ">", ">gv", { desc = "Indent line" })

-- Neogit
local neogit = require("neogit")
map("n", "<leader>gs", neogit.open, { silent = true, noremap = true })

-- nvim dap
local dap = require("dap")
local dapui = require("dapui")

map('n', '<F5>', dap.continue)
map('n', '<F10>', dap.step_over)
map('n', '<F11>', dap.step_into)
map('n', '<F12>', dap.step_out)
map("n", "<leader>db", dap.toggle_breakpoint)
map("n", "<leader>dt", function ()
  dapui.open({reset = true})
end)

-- Undo tree
map('n', '<leader>ut', function ()
  vim.cmd.UndotreeToggle()
  vim.cmd.UndotreeFocus()
end)

local nomap = vim.keymap.del

nomap("i", "<C-b>")
nomap("i", "<C-e>")
nomap("i", "<C-h>")
nomap("i", "<C-l>")
nomap("i", "<C-j>")
nomap("i", "<C-k>")
