local dap, dapui = require("dap"), require("dapui")
local map = vim.keymap.set

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

map('n', '<F5>', dap.continue)
map('n', '<F10>', dap.step_over)
map('n', '<F11>', dap.step_into)
map('n', '<F12>', dap.step_out)
map("n", "<leader>db", dap.toggle_breakpoint)
-- map("n", "<leader>dt", function ()
--   dapui.open({reset = true})
-- end)
