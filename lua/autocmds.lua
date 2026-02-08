require "nvchad.autocmds"

vim.api.nvim_create_user_command("DT", function()
  local config = vim.diagnostic.config
  local vt = config().virtual_text
  config {
    virtual_text = not vt,
    -- underline = not vt,
    -- signs = not vt,
  }
end, { desc = "toggle diagnostic" })

local lspAutoCmd = vim.api.nvim_create_augroup("lspAutoCmd", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
  callback = function()
    vim.lsp.codelens.refresh { bufnr = 0 }
  end,
  group = lspAutoCmd,
})

-- vim.api.nvim_create_autocmd("FileType", { pattern = "qf", command = "wincmd J", group = lspAutoCmd })
