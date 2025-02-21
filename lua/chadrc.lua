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
    style = "atom_colored", -- default/flat_light/flat_dark/atom/atom_colored
  },
  statusline = {
    theme = "minimal",
  },
  -- borderless / bordered
  telescope = { style = "borderless" },
}

return M
