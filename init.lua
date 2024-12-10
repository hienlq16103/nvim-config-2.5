vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- Personal configs

vim.api.nvim_create_user_command("DT", function()
  local config = vim.diagnostic.config
  local vt = config().virtual_text
  config {
    virtual_text = not vt,
    -- underline = not vt,
    -- signs = not vt,
  }
end, { desc = "toggle diagnostic" })

vim.wo.relativenumber = true
vim.g.undotree_DiffCommand = "FC"

require("luasnip").filetype_extend("cs", { "unity" })

vim.g.markdown_fenced_languages = {
  "ts=typescript",
}

local lspAutoCmd = vim.api.nvim_create_augroup("lspAutoCmd", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "CursorHold" }, {
  callback = function()
    vim.lsp.codelens.refresh { bufnr = 0 }
  end,
  group = lspAutoCmd,
})
