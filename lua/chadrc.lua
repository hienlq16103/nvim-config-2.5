-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {}

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

return M
