-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "nightfox",
  transparency = true,
}

M.ui = {
  cmp = {
    lspkind_text = true,
    style = "atom", -- default/flat_light/flat_dark/atom/atom_colored
  },
}

M.telescope = { style = "bordered" } -- borderless / bordered

M.nvdash = {
  load_on_startup = true,
}

M.colorify = {
  enabled = true,
  mode = "virtual", -- fg, bg, virtual
  virt_text = "󱓻 ",
  highlight = { hex = true, lspvars = true },
}

M.mason = {
  pkgs = {
    "lua-language-server",
    "clangd",
    "clang-format",
    "python-lsp-server",
    "haskell-language-server",
    "deno",
    "intelephense",
    "sqlls",
    "css-lsp",
    "texlab",
    "taplo",
    "markdown-oxide",
    "codelldb",
    "jdtls",
    "omnisharp",
    "omnisharp-mono",
    "cmake-language-server",
    "vim-language-server",
  },
}

return M
