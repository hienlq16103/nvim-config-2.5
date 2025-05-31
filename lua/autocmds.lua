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

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    pattern = "*",
    callback = function()
        local clients = vim.lsp.get_clients({ name = "roslyn" })
        if not clients or #clients == 0 then
            return
        end

        local buffers = vim.lsp.get_buffers_by_client_id(clients[1].id)
        for _, buf in ipairs(buffers) do
            vim.lsp.util._refresh("textDocument/diagnostic", { bufnr = buf })
        end
    end,
})
