-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "nightfox",
  transparency = true,
  hl_add = {
    NeogitDiffAdd = { bg = "#3a4d45", fg = "#768a67" },
    NeogitDiffDelete = { bg = "#5c3636", fg = "#8f5058" },
    NeogitDiffAddHighlight = { bg = "#3a4d45", fg = "#97b084" },
    NeogitDiffDeleteHighlight = { bg = "#5c3636", fg = "#9e5962" },
    NeogitDiffAddCursor = { bg = "#445b51", fg = "#97b084" },
    NeogitDiffDeleteCursor = { bg = "#673d3d", fg = "#9e5962" }
  },
}

M.ui = {
  cmp = {
    lspkind_text = true,
    style = "atom_colored", -- default/flat_light/flat_dark/atom/atom_colored
  },

  telescope = { style = "borderless" }, -- borderless / bordered
  statusline = {
    theme = "minimal", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "round",
  }
}

M.colorify = {
  enabled = true,
  mode = "virtual", -- fg, bg, virtual
  virt_text = "󱓻 ",
  highlight = { hex = true, lspvars = true },
}

return M
