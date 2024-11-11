-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "onedark",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}
M.nvdash = {
  load_on_startup = true,
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
  }
}

return M
