-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "nightfox",
  transparency = true,
  hl_add = {
    NvimDapViewTab = { fg = "#abb2bf", bg = "#282c34" },
    NvimDapViewTabSelected = { fg = "#98c379", bg = "#3e4452", bold = true },
    NvimDapViewTabFill = { bg = "#1e222a" }
  },
  hl_override = {
  }
}

M.ui = {
  cmp = {
    lspkind_text = true,
    style = "atom_colored", -- default/flat_light/flat_dark/atom/atom_colored
  },
  statusline = {
    theme = "minimal",
    separator_style = "round",
  },
  -- borderless / bordered
  telescope = { style = "borderless" },
}

M.term = {
  winopts = { number = false },
  sizes = { sp = 0.3, vsp = 0.3, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
  float = {
    row = 0.08, col = 0.04,
    width = 0.9, height = 0.8,
    border = "rounded",
  },
}

return M
