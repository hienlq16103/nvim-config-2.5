local dap = require "dap"
local dapui = require "dapui"

dapui.setup()

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

-- Mapping
map("n", "<F10>", dap.step_over)
map("n", "<F11>", dap.step_into)
map("n", "<F12>", dap.step_out)
map("n", "<leader>k", dapui.eval)
map("v", "<leader>k", "<cmd>lua require('dapui').eval()<CR>")

-- Icon and highlight
vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '' })
vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '' })
vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '' })

vim.fn.sign_define('DapBreakpoint', { text='', texthl='DapBreakpoint', linehl='', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text='', texthl='DapBreakpoint', linehl='', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', linehl='', numhl= 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='', numhl= 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='', numhl= 'DapStopped' })

-- Unity
local home_directory = vim.env.HOME
local vstuc_path = home_directory .. "/.vscode/extensions/visualstudiotoolsforunity.vstuc-1.1.0/bin/"

dap.adapters.vstuc = {
  type = "executable",
  command = "dotnet",
  args = { vstuc_path .. "UnityDebugAdapter.dll" },
  name = "Attach to Unity",
}

dap.configurations.cs = {
  {
    type = "vstuc",
    request = "attach",
    name = "Attach to Unity",
    logFile = vim.fs.joinpath(vim.fn.stdpath "data") .. "/vstuc.log",
    projectPath = function()
      local path = vim.fn.expand "%:p"
      while true do
        local new_path = vim.fn.fnamemodify(path, ":h")
        if new_path == path then
          return ""
        end
        path = new_path
        local assets = vim.fn.glob(path .. "/Assets")
        if assets ~= "" then
          return path
        end
      end
    end,
    endPoint = function()
      local system_obj = vim.system({ "dotnet", vstuc_path .. "UnityAttachProbe.dll" }, { text = true })
      local probe_result = system_obj:wait(2000).stdout
      if probe_result == nil or #probe_result == 0 then
        print "No endpoint found (is unity running?)"
        return ""
      end
      for json in vim.gsplit(probe_result, "\n") do
        if json ~= "" then
          local probe = vim.json.decode(json)
          for _, p in pairs(probe) do
            if p.isBackground == false then
              return p.address .. ":" .. p.debuggerPort
            end
          end
        end
      end
      return ""
    end,
  },
}
